class SupplierController < ApplicationController
  before_action :must_be_supplier!

  def must_be_supplier!
    redirect_to "https://www.youtube.com/watch?v=Jvk7faxsxkQ" unless current_user.role == "supplier"
  end
end
