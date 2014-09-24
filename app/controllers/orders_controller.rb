class OrdersController < UserController
  include ApplicationHelper

  def new
    @order = current_user.orders.new
    @user = current_user
  end

  def create
    @order = current_user.orders.new(order_params)
    @order.order_total = cart.total
    @order.order_status = Order::Status::ORDERED

    if out_of_stock?(@cart)
      cart_item = get_item_out_of_stock(@cart)
      redirect_to cart_path, notice: "There are not enough #{cart_item.item.title} in stock to fulfill your order."
    elsif @order.save!
      @cart.create_order_items(@order)
      reduce_item_inventory(@order)
      @order.create_sub_orders
      cart_destroy

      redirect_to dashboard_order_path(@order), notice: 'Order was successfully created.'
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order).permit(:order_type, :billing_address_id, :delivery_address_id)
  end
end
