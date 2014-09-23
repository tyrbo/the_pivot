class UserController < ApplicationController
  before_action :check_user

  private

  def check_user
    unless current_user
      session[:last_page] = request.path
      redirect_to signin_path, flash: { error: 'You must be logged in to access that.' }
    end
  end
end
