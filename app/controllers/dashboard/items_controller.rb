class Dashboard::ItemsController < ApplicationController
  def index
    @items = current_supplier.items.all
  end

  def show
    @item = current_supplier.items.find(params[:id])
  end

  def new
    @item = current_supplier.items.new
  end

  def create
    @item = current_supplier.items.create(item_params)

    if @item.save
      redirect_to dashboard_supplier_items_path(current_supplier)
    else
      render :new
    end
  end

  def edit
    @item = current_supplier.items.find(params[:id])
  end

  def update
    @item = current_supplier.items.find(params[:id])

    if @item.update(item_params)
      redirect_to dashboard_supplier_item_path(current_supplier, @item)
    else
      render :edit
    end

  end

  def destroy
    @item = current_supplier.items.find(params[:id])

    if @item.destroy
      redirect_to dashboard_supplier_items_path(current_supplier)
    else
      render :show
    end
  end

  private

  def item_params
    params.require(:item).permit(:title,
                                 :description,
                                 :price,
                                 :picture,
                                )
  end
end
