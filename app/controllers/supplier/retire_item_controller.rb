class Supplier::RetireItemController < ApplicationController

  def update
    @item = Item.find(params[:id])
    @item.update(retire: true)
    redirect_to admin_items_path(@item)
  end
end
