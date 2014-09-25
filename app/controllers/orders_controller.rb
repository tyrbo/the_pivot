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
    elsif @order.charge(params[:stripeToken]) && @order.save!
      if current_user.send_texts?
        client = Twilio::REST::Client.new(TWILIO_CONFIG['sid'], TWILIO_CONFIG['token'])
        client.account.sms.messages.create(
          from: TWILIO_CONFIG['from'],
          to: current_user.phone_number,
          body: "Thank you, your order has been placed! Respond to this number with 'Status' to get updates on your order, or 'Stop' to cancel text updates."
        )
      end

      @cart.create_order_items(@order)
      reduce_item_inventory(@order)
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
