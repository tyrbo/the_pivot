class Dashboard::UsersController < UserController
  before_action :check_user

  def index
    @admins = current_supplier.users.enabled
    @pending = current_supplier.users.pending
  end

  def destroy
    admin = current_supplier.suppliers_users.find_by(user_id: params[:id], supplier_id: current_supplier.id)
    admin.destroy
    redirect_to dashboard_supplier_users_path(current_supplier)
  end

  def pending_add
    pending_admin = current_supplier.users.find(params[:id])
    pending_admin.update_attribute(:role, 'supplier')
    redirect_to dashboard_supplier_users_path(current_supplier)
  end

  def pending_remove
    admin = current_supplier.suppliers_users.find_by(user_id: params[:id])
    admin.user.update_attribute(:role, 'customer')
    admin.destroy
    redirect_to dashboard_supplier_users_path(current_supplier)
  end

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user

    if @user.update(user_params)
      redirect_to dashboard_user_path
    else
      render :edit
    end
  end

  private

  def check_user
    unless current_user
      redirect_to signin_path, flash: { error: 'You must be logged in to access that.' }
    end
  end

  def user_params
    params.require(:user).permit(:full_name,
                                 :email,
                                 :display_name,
                                 :password,
                                 :password_confirmation
                                )
  end
end
