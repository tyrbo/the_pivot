class SuppliersController < ApplicationController
  def index
    @suppliers = User.active_suppliers
  end

  def show
    @supplier = User.find_by(id: params[:id], role: :supplier)
    @categories = Category.eager_load(:items).where('items.user_id = ?', params[:id])
  end
end
