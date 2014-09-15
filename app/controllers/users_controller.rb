class UsersController < ApplicationController
  def show
    must_be_user!
    @user = User.find(current_user.id)
  end

  def supplier_show
    @user = User.find(params[:id])
    render :show
  end

  def new
    @user  = User.new
    @title = "Create an account"
  end

  def create
    @user = User.create(user_params)

    if @user.save
      sign_in @user
      if params['user']['role'] == 'supplier'
        redirect_to new_supplier_path
      elsif params['user']['role'] == 'provider'
        flash[:success] = 'Thanks, for registering!'
        redirect_to root_path
      end
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
                                 :password,
                                 :password_confirmation
                                )
  end
end
