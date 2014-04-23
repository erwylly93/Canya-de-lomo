# encoding: utf-8
class CartController < ApplicationController
  before_filter :initialize_cart

  def add
    @product = Product.find(params[:id])
    @page_title = 'Añadir ítem'
    if request.post?
      @item = @cart.add(params[:id])
      flash[:cart_notice] = "<em>#{@item.product.name}</em> añadido.".html_safe
      redirect_to :controller => 'catalog'
    else
      render :controller => 'cart', :action => 'add', :template => 'cart/add'
    end
  end

  def remove
    @product = Product.find(params[:id])
    @page_title = 'Eliminar ítem'
    if request.post?
      @item = @cart.remove(params[:id])
      flash[:cart_notice] = "Eliminado 1 <em>#{@item.product.name}</em>.".html_safe
      redirect_to :controller => 'catalog'
    else
      render :controller => 'cart', :action => 'remove', :template => 'cart/remove'
    end
  end

  def clear
    @page_title = 'Vaciar carrito'
    if request.post?
      @cart.cart_items.destroy_all
      flash[:cart_notice] = "El carrito se ha vaciado."
      redirect_to :controller => 'catalog'
    else
      render :controller => 'cart', :action => 'clear', :template => 'cart/clear'
    end
  end
end
