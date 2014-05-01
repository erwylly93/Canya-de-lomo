#encoding: utf-8

class Order < ActiveRecord::Base
  attr_protected :id, :customer_ip, :status, :error_message, :created_at, :updated_at
  attr_accessor :card_type, :card_number, :card_expiration_month, :card_expiration_year,             
                :card_verification_value

  has_many :order_items
  has_many :products, :through => :order_items

  # validates_presence_of :order_items,
  #                       :message => '¡Tu carrito de la compra está vacío! ' +
  #                                   'Por favor, añade al menos un producto antes de continuar con el pedido.'
  # validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i
  # validates_length_of :phone_number, :in => 7..20

  # validates_length_of :ship_to_first_name, :in => 2..255
  # validates_length_of :ship_to_last_name, :in => 2..255
  # validates_length_of :ship_to_address, :in => 2..255
  # validates_length_of :ship_to_city, :in => 2..255
  # validates_length_of :ship_to_postal_code, :in => 2..255
  # validates_length_of :ship_to_country_code, :in => 2..255

  # validates_length_of :customer_ip, :in => 7..15
  # validates_inclusion_of :status, :in => %w(open processed closed failed)

  # validates_inclusion_of :card_type, :in => ['Visa', 'MasterCard', 'American Express', 'Discover'], :on => :create
  # validates_length_of :card_number, :in => 13..19, :on => :create
  # validates_inclusion_of :card_expiration_month, :in => %w(1 2 3 4 5 6 7 8 9 10 11 12), :on => :create
  # validates_inclusion_of :card_expiration_year, :in => %w(2014 2015 2016 2017 2018 2019), :on => :create
  # validates_length_of :card_verification_value, :in => 3..4, :on => :create

  def total
  	order_items.inject(0) { |sum, n| n.price * n.amout + sum }
  end

  def process
    result = true
    # por hacer. cargar al cliente llamando a la pasarela de pago
    self.status = 'processed'
    save!
    result
  end
end
