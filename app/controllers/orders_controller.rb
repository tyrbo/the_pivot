class OrdersController < UserController
  def show
    begin
      @order = current_user.orders.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to dashboard_root_path, flash: { error: 'You cannot access that resource.' }
    end
  end

  def create
    @order = current_user.orders.new(order_params)
    @order.order_total = cart.total
    @order.order_status = Order::Status::ORDERED

    if @order.save!
      @cart.create_order_items(@order)
      @order.create_sub_orders
      cart_destroy

      redirect_to @order, notice: 'Order was successfully created.'
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order).permit(:order_type, :delivery_address)
  end
end
