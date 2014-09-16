class Dashboard::SubOrdersController < ApplicationController

  def index
    @sub_orders = current_supplier.sub_orders
  end

  def show
    @sub_order = current_supplier.sub_orders.find(params[:id])
  end
end
