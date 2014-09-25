class UsersController < ApplicationController
  def new
    @user  = User.new
    @title = "Create an account"
  end

  def create
    @user = User.create(user_params)

    if @user.save
      UserConfirmationMailer.welcome_email(@user).deliver
      sign_in @user
      if params['user']['role'] == 'supplier'
        redirect_to new_supplier_path
      else
        flash[:success] = 'Thanks, for registering!'
        redirect_to session.delete(:last_page) || root_path
      end
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:full_name,
                                 :email,
                                 :display_name,
                                 :password,
                                 :password_confirmation,
                                 :phone_number,
                                 :send_texts
                                )
  end
end
