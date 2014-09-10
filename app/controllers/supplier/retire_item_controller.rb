class Supplier::RetireItemController < SupplierController
  def update
    @item = Item.find(params[:id])
    @item.retire ^= true
    @item.save
    redirect_to supplier_items_path
  end
end
