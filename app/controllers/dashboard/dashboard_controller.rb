class Dashboard::DashboardController < UserController
  def index
    @orders = current_user.orders
    @suppliers = current_user.suppliers
  end
end
