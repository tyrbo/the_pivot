class Supplier::OrdersController < SupplierController
  before_action	:set_order, only: [:show, :edit, :update, :destroy, :cancel, :pay, :complete]

  def index
    @status_counts = Order.status_counts
    @all_count     = Order.count
    if params[:filter]
      @orders = Order.where(order_status: params[:filter])
    else
      @orders = Order.all
    end
  end

  def cancel
    @order.order_status = "cancelled"
    @order.save
    redirect_to supplier_order_path(@order)
  end

  def pay
    @order.order_status = "paid"
    @order.save
    redirect_to supplier_order_path(@order)
  end

  def complete
    @order.order_status = 'completed'
    @order.save
    redirect_to supplier_order_path(@order)
  end

  def destroy
    @order.destroy
    redirect_to supplier_orders_path
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:user_id,
                                  :order_total,
                                  :order_type,
                                  :delivery_address,
                                  :order_status
                                 )
  end
end
