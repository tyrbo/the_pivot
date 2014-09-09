class OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.new(order_params)
    respond_to do |format|
      if @order.save!
        @cart.items.each do |item|
          @order.order_items.create!(item_id: item.id, order_id: @order.id)
        end
        cart_destroy
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
      else
        render :new
      end
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
