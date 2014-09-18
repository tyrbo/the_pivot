class Admin::SuppliersController < AdminController
  def toggle_enabled
    @supplier = Supplier.find(params[:supplier_id])
    @supplier.toggle_enabled
    @supplier.save

    redirect_to admin_root_path
  end
end
