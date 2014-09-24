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

    if @order.save!
      if current_user.send_texts?
        client = Twilio::REST::Client.new(TWILIO_CONFIG['sid'], TWILIO_CONFIG['token'])
        client.account.sms.messages.create(
          from: TWILIO_CONFIG['from'],
          to: current_user.phone_number,
          body: "Thank you, your order has been placed! Respond to this number with 'Status' to get updates on your order, or 'Stop' to cancel text updates."
        )
      end
      @cart.create_order_items(@order)
      @order.create_sub_orders
      cart_destroy

      redirect_to dashboard_order_path(@order), notice: "Your order was successfully created!"
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order).permit(:order_type, :billing_address_id, :delivery_address_id)
  end
end
