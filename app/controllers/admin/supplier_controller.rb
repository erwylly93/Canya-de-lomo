class Admin::SupplierController < ApplicationController
  def new
    @supplier = Supplier.new
    @page_title = 'Crear nuevo proveedor'
  end

  def create
    @supplier = Supplier.new(supplier_params)
    if @supplier.save
        flash[:notice] = "El proveedor #{@supplier.name} ha sido creado."
        redirect_to :action => 'index'
    else
        @page_title = "Crear nuevo proveedor"
        render :action => 'new'
    end
  end

  def supplier_params
    params.require(:supplier).permit(:id, :name, :street, :city, :phone)
  end

  def edit
    @supplier = Supplier.find(params[:id])
    @page_title = 'Editar proveedor'
  end

  def update
    @supplier = Supplier.find(params[:id])
    if @supplier.update_attributes(supplier_params)
      flash[:notice] = "El proveedor ha sido actualizado."
      redirect_to :action => 'show', :id => @supplier
    else
      @page_title = "Editar proveedor"
      render :action => 'edit'
    end
  end

  def destroy
    @supplier = Supplier.find(params[:id])
    flash[:notice] = "El proveedor #{@supplier.name} ha sido borrado."
    @supplier.destroy
    redirect_to :action => 'index'
  end

  def show
    @supplier = Supplier.find(params[:id])
    @page_title = Supplier.name
  end

  def index
    @suppliers = Supplier.all
    @page_title = 'Lista de proveedores'
  end
end