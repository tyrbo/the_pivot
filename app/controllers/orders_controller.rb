class OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
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
