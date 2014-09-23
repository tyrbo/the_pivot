class Dashboard::SuppliersController < Dashboard::SupplierController
  before_action :check_supplier, only: [:show]

  def index
    @suppliers = current_user.suppliers.approved
  end

  def show
    @supplier = current_user.suppliers.approved.find(params[:id])
  end

  def edit
    @supplier = current_user.suppliers.approved.find(params[:id])
  end

  def update
    @supplier = current_user.suppliers.approved.find(params[:id])

    if @supplier.update(supplier_params)
      redirect_to supplier_path(@supplier)
    else
      render :edit
    end
  end

  private

  def supplier_params
    params.require(:supplier).permit(:description)
  end
end
