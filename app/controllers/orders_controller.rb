class OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.new(order_params)
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
    params.require(:order).permit(:user_id,
                                  :order_total,
                                  :order_type,
                                  :delivery_address,
                                  :order_status
                                 )
  end
end
