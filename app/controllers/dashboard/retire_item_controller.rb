class Dashboard::RetireItemController < Dashboard::SupplierController
  def update
    @item = Item.find(params[:id])
    @item.update_retired_attribute
    redirect_to dashboard_supplier_items_path(current_supplier)
  end
end
