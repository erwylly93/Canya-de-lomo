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

    #@product = Product.find(params[:id]) rescue nil
    #  return render(:text => "Producto no encontrado", :status => 404)
    #unless @product
    #  @page_title = @product.name
    # end
  
  end

  def search
  end

  def latest
  end
end
