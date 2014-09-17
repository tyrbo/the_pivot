class Dashboard::DashboardController < ApplicationController
  def index
    @orders = current_user.orders
    @suppliers = current_user.suppliers
  end
end
