class Dashboard::SuppliersController < Dashboard::SupplierController
  before_action :check_supplier, only: [:show]

  def index
    @suppliers = current_user.suppliers.approved
  end

  def show
    @supplier = current_user.suppliers.approved.find(params[:id])
  end
end
