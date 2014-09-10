class UsersController < ApplicationController
  def show
    must_be_user!
    @user = User.find(current_user.id)
  end

  def new
    @user  = User.new
    @title = "Create an account"
  end

  def create
    @user = User.create(user_params)

    if @user.save
      sign_in @user
      if @user.role == 'supplier'
        flash[:success] = 'Thanks, your request is pending!'
      elsif @user.role == 'provider'
        flash[:success] = 'Thanks, for registering!'
      end
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:full_name,
                                 :email,
                                 :display_name,
                                 :role,
                                 :password,
                                 :password_confirmation
                                )
  end
end
