class Dashboard::SuppliersController < Dashboard::SupplierController
  before_action :check_supplier, only: [:show]

  def index
    @suppliers = current_user.suppliers
  end

  def show
    @supplier = current_user.suppliers.find(params[:id])
  end
end
