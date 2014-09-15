class Supplier::ItemsController < SupplierController
  before_action	:set_item, only: [:show, :edit, :update, :destroy]

  def new
    @item = Item.new
  end

  def index
    @items = current_supplier.items.all
  end

  def update
    if @item.update(item_params)
      @item.categories = Category.where(id: params[:item][:categories])
      redirect_to supplier_item_path(@item), notice: 'Item was successfully updated.'
    else
      render :edit
    end
  end

  def create
    @item = current_supplier.items.new(item_params)
    @item.categories = Category.where(id: params[:item][:categories])

    if @item.save
      redirect_to supplier_item_path(@item), notice: 'Item was successfully created.'
    else
      render :new
    end
  end

  def destroy
    if @item.destroy
      redirect_to supplier_items_path, notice: 'Item was successfully deleted.'
    end
  end

  private

  def current_supplier
    Supplier.find(params[:supplier_id])
  end

  def set_item
    @item = current_supplier.items.find(params[:id])
    unless @item
      redirect_to root_path, notice: 'You can\'t access that resource.'
    end
  end

  def item_params
    params.require(:item).permit(:title,
                                 :description,
                                 :price,
                                 :picture,
                                )
  end
end
