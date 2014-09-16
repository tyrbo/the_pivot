class Dashboard::SuppliersController < ApplicationController
  def index
    @suppliers = current_user.suppliers
  end

  def show
    @supplier = current_user.suppliers.find(params[:id])
  end
end
