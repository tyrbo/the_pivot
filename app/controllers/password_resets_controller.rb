class PasswordResetsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    user.send_password_reset if user
    redirect_to signin_path, notice: 'You should receive an email soon with instructions for resetting your password.'
  end

  def edit
    @user = User.find_by(password_reset_token: params[:id])

    unless @user
      redirect_to new_password_reset_path, notice: 'The reset token you provided is invalid.'
    end
  end

  def update
    @user = User.find_by(password_reset_token: params[:id])

    if @user && @user.update_attributes(params[:user].permit(:password, :password_confirmation))
      redirect_to signin_path, notice: 'Your password has been reset.'
    else
      render :edit
    end
  end
end
