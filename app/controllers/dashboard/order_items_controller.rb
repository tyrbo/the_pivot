class Dashboard::OrderItemsController < ApplicationController
  def edit
    @sub_order = current_supplier.sub_orders.find(params[:sub_order_id])
    @order_items = @sub_order.order_items.find_all
  end

  def update
    @order_item = current_supplier.sub_orders.find(params[:sub_order_id]).order_items.find(params[:id])

    if @order_item.update(order_item_params)
      redirect_to edit_dashboard_supplier_sub_order_order_item_path(current_supplier.id, @order_item.sub_order.id, @order_item)
    else
      render :edit
    end
  end

  def destroy
    @order_item = current_supplier.sub_orders.find(params[:sub_order_id]).order_items.find(params[:id])
    @order_item.destroy
    redirect_to edit_dashboard_supplier_sub_order_path(current_supplier.id, @order_item.sub_order.id)
  end

  private

  def order_item_params
    params.require(:order_item).permit(:quantity, :price)
  end
end
