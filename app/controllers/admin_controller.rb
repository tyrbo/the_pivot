class AdminController < ApplicationController
  before_action :authorize?

  private

  def authorize?
    if !current_user || current_user.role != 'admin'
      redirect_to "https://www.youtube.com/watch?v=Jvk7faxsxkQ"
    end
  end
end
