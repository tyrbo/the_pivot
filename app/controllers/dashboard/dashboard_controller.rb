class Dashboard::DashboardController < UserController
  def index
    @orders = current_user.orders
  end
end
