class Dashboard::OrderItemsController < Dashboard::SupplierController
  def destroy
    @order_item = current_supplier.sub_orders.find(params[:sub_order_id]).order_items.find(params[:id])
    @order_item.destroy
    redirect_to edit_dashboard_supplier_sub_order_path(current_supplier.id, @order_item.sub_order.id)
  end
end
