class Admin::AdminController < AdminController
  def index
    @suppliers = Supplier.all
  end
end
