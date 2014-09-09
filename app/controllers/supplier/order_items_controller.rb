class Supplier::OrderItemsController < SupplierController
  before_action :find_order_item

  def increment
    @order.items << @order_item.item
    redirect_to supplier_order_path(@order)
  end

  def decrement
    @order_item.delete if @order_item
    redirect_to supplier_order_path(@order)
  end

  private

  def find_order_item
    @order     = Order.find(params[:order_id])
    @order_item = @order.order_items.find(params[:id])
  end
end
