class SupplierController < ApplicationController
  before_action :authorize!

  def authorize!
    redirect_to "https://www.youtube.com/watch?v=Jvk7faxsxkQ" unless current_user.role == "supplier"
  end
end
