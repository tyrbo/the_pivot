class Dashboard::SupplierController < ApplicationController
  before_action :check_supplier

  private

  def check_supplier
    unless current_user.suppliers.include?(current_supplier)
      redirect_to dashboard_root_path, flash: { error: 'You cannot access that resource.' }
    end
  end
end
