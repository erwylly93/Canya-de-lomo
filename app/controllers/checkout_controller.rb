#encoding: utf-8

class CheckoutController < ApplicationController
  before_filter :initialize_cart, :only => :index

  def index
  	@order = Order.new
  	@page_title = "Checkout"
  	if @cart.products.empty?
  		flash[:notice] = '¡Tu carrito de la compra está vacío! ' +
                           'Por favor, añade al menos un producto antes de continuar con el pedido.'
        redirect_to :controller => 'catalog'
    end
  end

  def submit_order
    @cart = Cart.find(params[:cart][:id])
    @order = Order.new(params[:order])
    @order.customer_ip = request.remote_ip
    @order.status = 'open'
    @page_title = "Checkout"
    populate_order

    if @order.save
      if @order.process
        flash[:notice] = "Tu pedido se ha enviado, y se procesará inmediatamente."
        session[:order_id] = @order.id
        @cart.cart_items.destroy_all
        redirect_to :action => 'thank_you'
      else
        flash[:notice] = "Hubo un error al completar el pedido. \"#{@order.error_message}'\""
        render :action => 'index'
      end
    else
      render :action => 'index'
    end
  end

  def thank_you
    @page_title = '¡Gracias!'
  end

  private

  def populate_order
    for cart_item in @cart.cart_items
      @order.order_items << OrderItem.new(
        :product_id => cart_item.product_id,
        :price => cart_item.price,
        :amount => cart_item.amount
      )
    end
  end
end
