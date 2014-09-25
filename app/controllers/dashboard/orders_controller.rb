class Dashboard::OrdersController < UserController
  def show
    begin
      binding.pry
      @order = current_user.orders.find(params[:id])
      if @order.delivery_address_id != nil
        @delivery_address = Address.find(@order.delivery_address_id)
      end
    rescue ActiveRecord::RecordNotFound
      redirect_to dashboard_root_path, flash: { error: 'You cannot access that resource.' }
    end
  end
end
