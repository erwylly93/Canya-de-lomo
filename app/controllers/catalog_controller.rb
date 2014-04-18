#encoding: utf-8
class CatalogController < ApplicationController
  def index
  	@page_title = "Lista de productos"
  	@products = Product.paginate :page => params[:page],
								 :per_page => 10,
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
    @products = @search.all
    unless @products.size > 0
      flash.now[:notice] = "La búsqueda no produjo resultados."
    end
  end

  def latest
  end
end
