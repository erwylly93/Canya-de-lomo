#encoding: utf-8
class CatalogController < ApplicationController
  def index
  	@page_title = "Catálogo de productos"
  	@products = Product.paginate :page => params[:page],
								 :per_page => 5,
								 :include => [:brand, :suppliers],
								 :order => "products.id desc"
  end

  def show
    unless @product = Product.find_by_id(params[:id])
      return render(:text => "Producto no encontrado", :status => 404)
    end 
    @page_title = @product.name
  end

  def search
    @page_title = "Buscar producto"
    @search = Product.search(params[:search])
    if params[:search]
      if !params[:search][:name_contains].blank?
        @products = @search.all
        flash.now[:notice] = "La búsqueda no produjo resultados." unless @products.size > 0
      else
        flash.now[:notice] = "Introduzca alguna búsqueda." 
      end
    end
  end

  def latest
    @page_title = "Últimos productos"
    @products = Product.latest 5
  end

  def rss
    latest
    render :layout => false
    response.headers["Content-Type"] = "application/xml; version=1.0; charset=utf-8"
  end
end
