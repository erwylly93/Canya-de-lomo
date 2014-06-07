class Admin::ProductController < Admin::AuthenticatedController
  def new
    load_data
    @product = Product.new
    @page_title = 'Crear nuevo producto'
  end

  def create
    @product = Product.new(params[:product])
		@product.tag_list.add(params[:tags], parse: true)
    if @product.save
      flash[:notice] = "El producto #{@product.name} ha sido creado"
      redirect_to :action => 'index'
    else
      load_data
      @page_title = 'Crear nuevo producto'
      render :action => 'new'
    end
  end

  def edit
    load_data
    @product = Product.find(params[:id])
    @page_title = 'Editar producto'
  end

  def update
    @product = Product.find(params[:id])
    @product.tag_list.remove(@product.tag_list.split(","), parse: true);
    @product.tag_list.add(params[:tags], parse: true)
    if @product.update_attributes(params[:product])
			Tag.clean
      flash[:notice] = "El producto ha sido actualizado."
      redirect_to :action => 'show', :id => @product
    else
      load_data
      @page_title = 'Editar producto'
      render :action => 'edit'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    flash[:notice] = "El producto #{@product.name} ha sido borrado."
    @product.destroy
    redirect_to :action => 'index'
  end

  def show
    @product = Product.find(params[:id])
    @page_title = @product.name
  end

  def index
    sort_by = params[:sort_by]
    @products = Product.paginate :page => params[:page], :order => sort_by, :per_page => 5
    @page_title = 'Lista de productos'
  end

private
  def load_data
    @suppliers = Supplier.find(:all)
    @brands = Brand.find(:all)
		@tags = Tag.find(:all)
  end
end
