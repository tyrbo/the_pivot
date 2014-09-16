class SuppliersController < ApplicationController
  def new
    @supplier = Supplier.new
  end

  def create
    @supplier = current_user.suppliers.new(supplier_params)

    if @supplier.save
      flash[:success] = 'Thanks, your request is pending!'
      redirect_to root_path
    else
      render :new
    end
  end

  def index
    @suppliers = Supplier.all
  end

  def show
    @supplier = Supplier.find_by(id: params[:id])
    @categories = Category.eager_load(:items).where('items.supplier_id = ?', params[:id])
  end

  private

  def supplier_params
    params.require(:supplier).permit(:name, :url, :description)
  end
end
