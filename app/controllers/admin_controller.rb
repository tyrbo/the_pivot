class AdminController < UserController
  before_action :check_admin

  private

  def check_admin
    unless current_user.role == 'admin'
      redirect_to dashboard_root_path, flash: { error: 'You cannot access that resource.' }
    end
  end
end
