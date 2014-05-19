# encoding: utf-8
class CartController < ApplicationController
  before_filter :initialize_cart

  def add
    @product = Product.find(params[:id])
    @page_title = 'Añadir ítem'
    if request.xhr?
      @item = @cart.add(params[:id])
      flash.now[:cart_notice] = "<em>#{@item.product.name}</em> producto añadido".html_safe
      render :controller => 'cart', :action => 'add_with_ajax'
    elsif request.post?
      if params[:amount].to_i > 0
        @item = @cart.add(params[:id], params[:amount].to_i)
        flash[:cart_notice] = "#{params[:amount] if params[:amount].to_i > 1} <em>#{@item.product.name}</em> 
                               #{params[:amount].to_i > 1 ? "añadidos" : "añadido"}".html_safe
        redirect_to :controller => 'catalog'
      else
        flash[:add_cart_notice] = "¡Cantidad incorrecta!"
        render :controller => 'cart', :action => 'add', :template => 'cart/add'
      end
    else
      render :controller => 'cart', :action => 'add', :template => 'cart/add'
    end
  end

  def remove
    @product = Product.find(params[:id])
    @page_title = 'Eliminar ítem'
    if request.xhr?
      @item = @cart.remove(params[:id])
      flash.now[:cart_notice] = "<em>#{@item.product.name}</em> producto eliminado".html_safe
      render :controller => 'cart', :action => 'remove_with_ajax'
    elsif request.post?
      if @cart.cart_items.find_by_product_id(params[:id].to_i).amount - params[:amount].to_i >= 0
        @item = @cart.remove(params[:id], params[:amount].to_i)
        flash[:cart_notice] = "#{params[:amount] if params[:amount].to_i > 1} <em>#{@item.product.name}</em> 
                               #{params[:amount].to_i > 1 ? "eliminados" : "eliminado"}".html_safe
        redirect_to :controller => 'catalog'
      else
        flash[:remove_cart_notice] = "¡Cantidad incorrecta!"
        render :controller => 'cart', :action => 'remove', :template => 'cart/remove'
      end
    else
      render :controller => 'cart', :action => 'remove', :template => 'cart/remove'
    end
  end

  def clear
    @page_title = 'Vaciar carrito'
    if request.xhr?
      @cart.cart_items.destroy_all
      flash.now[:cart_notice] = "El carrito se ha vaciado"
      render :controller => 'cart', :action => 'clear_with_ajax'
    elsif request.post?
      @cart.cart_items.destroy_all
      flash[:cart_notice] = "El carrito se ha vaciado"
      redirect_to :controller => 'catalog'
    else
      render :controller => 'cart', :action => 'clear', :template => 'cart/clear'
    end
  end
end
