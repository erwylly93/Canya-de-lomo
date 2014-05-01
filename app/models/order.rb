#encoding: utf-8

class Order < ActiveRecord::Base
  attr_protected :id, :customer_ip, :status, :error_message, :created_at, :updated_at
  attr_accessor :card_type, :card_number, :card_expiration_month, :card_expiration_year,             
                :card_verification_value

  has_many :order_items
  has_many :products, :through => :order_items

  validates_presence_of :order_items,
                        :message => '¡Tu carrito de la compra está vacío! ' +
                                    'Por favor, añade al menos un producto antes de continuar con el pedido.'
  validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i
  validates_length_of :phone_number, :in => 7..20

  validates_length_of :ship_to_first_name, :in => 2..255
  validates_length_of :ship_to_last_name, :in => 2..255
  validates_length_of :ship_to_address, :in => 2..255
  validates_length_of :ship_to_city, :in => 2..255
  validates_length_of :ship_to_postal_code, :in => 2..255
  validates_length_of :ship_to_country_code, :in => 2..255

  validates_length_of :customer_ip, :in => 7..15
  validates_inclusion_of :status, :in => %w(open processed closed failed)

  validates_inclusion_of :card_type, :in => ['Visa', 'MasterCard', 'American Express', 'Discover'], :on => :create
  validates_length_of :card_number, :in => 13..19, :on => :create
  validates_inclusion_of :card_expiration_month, :in => %w(1 2 3 4 5 6 7 8 9 10 11 12), :on => :create
  validates_inclusion_of :card_expiration_year, :in => %w(2014 2015 2016 2017 2018 2019), :on => :create
  validates_length_of :card_verification_value, :in => 3..4, :on => :create

  def total
  	order_items.inject(0) { |sum, n| n.price * n.amount + sum }
  end

  def process
    begin
      raise 'Un pedido cerrado no se puede procesar de nuevo' if self.closed?
      active_merchant_payment
    rescue => e
      logger.error("El pedido #{id} ha fallado debido a una excepción: #{e}.")
      self.error_message = "Excepción: #{e}"
      self.status = 'failed'
    end
    save!
    self.processed?
  end

  def active_merchant_payment
    ActiveMerchant::Billing::Base.mode = :test
    ActiveMerchant::Billing::AuthorizeNetGateway.default_currency = 'USD'
    ActiveMerchant::Billing::AuthorizeNetGateway.wiredump_device = STDERR   
    ActiveMerchant::Billing::AuthorizeNetGateway.wiredump_device.sync = true
    self.status = 'failed'

    creditcard = ActiveMerchant::Billing::CreditCard.new(
      :brand              => card_type,
      :number             => card_number,
      :month              => card_expiration_month,
      :year               => card_expiration_year,
      :verification_value => card_verification_value,
      :first_name         => ship_to_first_name,
      :last_name          => ship_to_last_name
    )

    if creditcard.valid?
      gateway = ActiveMerchant::Billing::AuthorizeNetGateway.new(
        :login     => '8jHK88bQ',
        :password  => '98yw4Rk4T7nZ2K7B'
      )

      shipping_address = {
        :first_name => ship_to_first_name,
        :last_name  => ship_to_last_name,
        :address1   => ship_to_address,
        :city       => ship_to_city,
        :zip        => ship_to_postal_code,
        :country    => ship_to_country_code,
        :phone      => phone_number
      }

      details = {
        :description      => 'Compra Caña de Lomo',
        :order_id         => self.id,
        :email            => email,
        :ip               => customer_ip,
        :billing_address  => shipping_address,
        :shipping_address => shipping_address
      }

      eucentralbank = EuCentralBank.new
      eucentralbank.update_rates

      amount = eucentralbank.exchange((self.total * 100).to_i, 'EUR', 'USD').cents
      response = gateway.purchase(amount, creditcard, details)

      if response.success?
        self.status = 'processed'
      else
        self.error_message = response.message
      end
    else
      self.error_message = 'Tarjeta de crédito inválida'
    end
  end

  def processed?
    self.status == 'processed'
  end

  def failed?
    self.status == 'failed'
  end

  def closed?
    self.status == 'closed'
  end

  def close
    self.status = 'closed'
    save!
  end
end
