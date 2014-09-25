class SuppliersController < ApplicationController
  def new
    @supplier = Supplier.new
  end

  def create
    @supplier = Supplier.new(supplier_params)

    if @supplier.save
      current_user.suppliers << @supplier
      current_user.suppliers_users.first.update_attribute(:role, 'supplier')

      flash[:success] = 'Thanks, your request is pending!'
      redirect_to root_path
    else
      render :new
    end
  end

  def add_pending_admin
    @supplier = Supplier.find(params[:supplier_id])
    @supplier.pending_users << current_user

    redirect_to dashboard_root_path, flash: { success: 'Request has been made!' }
  end

  def index
    @suppliers = Supplier.approved
  end

  def show
    @supplier = Supplier.approved.friendly.find(params[:id])
    @categories = Category.eager_load(:items).where('items.supplier_id = ?', @supplier.id)
    @added = { item_name: params[:item_name], item_picture: params[:item_picture] }
  end

  private

  def supplier_params
    params.require(:supplier).permit(:name, :url, :description)
  end
end
