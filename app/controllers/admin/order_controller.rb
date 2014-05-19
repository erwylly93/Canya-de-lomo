class Admin::OrderController < Admin::AuthenticatedController
  def index
  	@status = params[:id]
    if @status.blank?
      @status = ''
      conditions = nil
      @page_title = "Lista de todos los pedidos"
    else
      conditions = "status = '#{@status}'"
      estado = case @status
        when "open" then "abiertos"
        when "processed" then "procesados"
        when "closed" then "cerrados"
        when "failed" then "fallidos"
      end
      @page_title = "Lista de pedidos #{estado}"
    end
    sort_by = params[:sort_by]
    @orders = Order.paginate :page => params[:page], :conditions => conditions, 
              :per_page => 10, :order => sort_by
  end

  def show
    @order = Order.find(params[:id])
    @page_title = "Mostrando pedido ##{@order.id}"
  end

  def close
    order = Order.find(params[:id])
    order.close
    flash[:notice] = "Se ha cerrado el pedido ##{order.id}."
    redirect_to :action => 'index'
  end
end
