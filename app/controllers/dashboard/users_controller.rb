class Dashboard::UsersController < Dashboard::SupplierController
  def index
    @admins = current_supplier.users.admins
    @pending = current_supplier.users.pending
  end

  def destroy
    admin = current_supplier.suppliers_users.find_by(user_id: params[:id], supplier_id: current_supplier.id)
    admin.destroy
    redirect_to dashboard_supplier_users_path(current_supplier)
  end

  def pending_add
    pending_admin = current_supplier.users.find(params[:id])
    pending_admin.update_attribute(:role, 'admin')
    redirect_to dashboard_supplier_users_path(current_supplier)
  end

  def pending_remove
    admin = current_supplier.suppliers_users.find_by(user_id: params[:id])
    admin.user.update_attribute(:role, 'customer')
    admin.destroy
    redirect_to dashboard_supplier_users_path(current_supplier)
  end
end
