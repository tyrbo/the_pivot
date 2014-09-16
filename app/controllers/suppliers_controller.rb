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
    @suppliers = User.active_suppliers
  end

  def show
    @supplier = User.find_by(id: params[:id], role: :supplier)
    @categories = Category.eager_load(:items).where('items.user_id = ?', params[:id])
  end

  private

  def supplier_params
    params.require(:supplier).permit(:name, :url, :description)
  end
end
