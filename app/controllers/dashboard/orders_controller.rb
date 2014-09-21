class Dashboard::OrdersController < UserController
  def show
    begin
      @order = current_user.orders.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to dashboard_root_path, flash: { error: 'You cannot access that resource.' }
    end
  end
end
