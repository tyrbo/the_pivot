class PasswordResetsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    user.send_password_reset if user
    redirect_to signin_path, notice: 'You should receive an email soon with instructions for resetting your password.'
  end
end
