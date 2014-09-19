class SuppliersController < ApplicationController
  def new
    @supplier = Supplier.new
  end

  def create
    @supplier = Supplier.new(supplier_params)

    if @supplier.save
      current_user.suppliers << @supplier
      current_user.suppliers_user.update_attribute(:pending, false)

      flash[:success] = 'Thanks, your request is pending!'
      redirect_to root_path
    else
      render :new
    end
  end


#user role to pending
  def add_pending_admin
    @supplier = Supplier.find(params[:supplier_id])
    @supplier.users << current_user
    current_user.update_attribute(:role, 'pending')
    redirect_to supplier_path(@supplier)
    flash[:success] = "Request has been made!"
  end

  def index
    @suppliers = Supplier.all
  end

  def show
    binding.pry
    @supplier = supplier
    @categories = Category.eager_load(:items).where('items.supplier_id = ?', @supplier.id)
  end

  private

  def supplier_params
    params.require(:supplier).permit(:name, :url, :description)
  end
end
