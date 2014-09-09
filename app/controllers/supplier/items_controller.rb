class Supplier::ItemsController < SupplierController
  before_action	:set_item, only: [:show, :edit, :update, :destroy, :retire]

  def new
    @item = Item.new
  end

  def index
    @items = Item.all
  end

  def update
    if @item.update(item_params)
      @item.categories = Category.where(id: params[:item][:categories])
      flash.notice = 'Item was successfully updated.'
      redirect_to supplier_item_path(@item)
    else
      render :edit
    end
  end

  def create
    @item = Item.new(item_params)
    @item.categories = Category.where(id: params[:item][:categories])

    if @item.save
      flash.notice = 'Item was successfully created.'
      redirect_to supplier_item_path(@item)
    else
      render :new
    end
  end

  def show
  end


  def destroy
    if @item.destroy
      redirect_to supplier_items_path, notice: 'Item was successfully deleted.'
    end
  end


  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:title,
                                 :description,
                                 :price_pie,
                                 :picture,
                                )
  end
end
