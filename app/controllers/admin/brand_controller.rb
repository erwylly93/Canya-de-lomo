class Admin::BrandController < ApplicationController
  def new
    @brand = Brand.new
    @page_title = 'Crear nueva marca'
  end

  def create
    @brand = Brand.new(params[:brand])
    if @brand.save
        flash[:notice] = "La marca #{@brand.name} ha sido creada."
        redirect_to :action => 'index'
    else
        @page_title = "Crear nuevo marca"
        render :action => 'new'
    end
  end

  def edit
    @brand = Brand.find(params[:id])
    @page_title = 'Editar marca'
  end

  def update
    @brand = Brand.find(params[:id])
    if @brand.update_attributes(params[:brand])
      flash[:notice] = "La marca ha sido actualizada."
      redirect_to :action => 'show', :id => @brand
    else
      @page_title = "Editar marca"
      render :action => 'edit'
    end
  end

  def destroy
    @brand = Brand.find(params[:id])
    flash[:notice] = "La marca #{@brand.name} ha sido borrada."
    @brand.destroy
    redirect_to :action => 'index'
  end

  def show
    @brand = Brand.find(params[:id])
    @page_title = Brand.name
  end

  def index
    @brands = Brand.all
    @page_title = 'Lista de marcas'
  end
end