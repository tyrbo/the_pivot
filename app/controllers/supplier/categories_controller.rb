class Supplier::CategoriesController < SupplierController
  before_action	:set_category, 	only: [:show, :edit, :update, :destroy]

  def new
    @category = Category.new
  end

  def index
    @category = Category.all
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to supplier_category_path(@category), notice: 'Category was succesfully created.'
    else
      render :new
    end
  end

  def update
    if @category.update(category_params)
      redirect_to supplier_category_path(@category), notice: 'Category was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to supplier_categories_path
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
