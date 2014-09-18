class Dashboard::SubOrdersController < Dashboard::SupplierController

  def index
    @sub_orders = current_supplier.sub_orders
  end

  def show
    @sub_order = current_supplier.sub_orders.find(params[:id])
  end

  def edit
    @sub_order = current_supplier.sub_orders.find(params[:id])
  end

  def update
    @sub_order = current_supplier.sub_orders.find(params[:id])

    if @sub_order.update(sub_order_params)
      redirect_to dashboard_supplier_sub_order_path(current_supplier, @sub_order)
    else
      render :edit
    end
  end

  private

  def sub_order_params
    params.require(:sub_order).permit(:provider_name, :provider_email)
  end
end
