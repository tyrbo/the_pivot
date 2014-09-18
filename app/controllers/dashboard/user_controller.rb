class Dashboard::UserController < ApplicationController
  before_action :check_user

  private

  def check_user
    unless current_user
      redirect_to signin_path, flash: { error: 'You must be logged in to access that.' }
    end
  end
end
