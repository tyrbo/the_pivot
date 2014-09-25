class Dashboard::SubOrdersController < Dashboard::SupplierController
  before_action :set_orders

  def index
    if params[:filter]
      @sub_orders = current_supplier.sub_orders.includes(order_items: :item).includes(order: :user).select do |sub_order|
        sub_order.status == params[:filter]
      end
    else
      @sub_orders = current_supplier.sub_orders.includes(order_items: :item).includes(order: :user)
    end
  end

  def show
    @sub_order = current_supplier.sub_orders.find(params[:id])
    if @sub_order.delivery?
      @delivery_address = Address.find(@sub_order.delivery_address_id)
    end
  end

  def edit
    @sub_order = current_supplier.sub_orders.find(params[:id])
    if @sub_order.delivery?
      @delivery_address = Address.find(@sub_order.delivery_address_id)
    end
  end

  def update
    @sub_order = current_supplier.sub_orders.find(params[:id])
    if @sub_order.update(sub_order_params)
      
      redirect_to dashboard_supplier_sub_order_path(current_supplier, @sub_order)
    else
      render :edit
    end
  end

  def destroy
    @sub_order = current_supplier.sub_orders.find(params[:id])
    @sub_order.destroy
    redirect_to dashboard_supplier_sub_orders_path(current_supplier)
  end

  private

  def sub_order_params
    params.require(:sub_order).permit(:provider_name, :provider_email, :status)
  end

  def set_orders
      @ordered = SubOrder.ordered
      @cancelled = SubOrder.cancelled
      @paid     = SubOrder.paid
      @completed = SubOrder.completed    
  end
end
