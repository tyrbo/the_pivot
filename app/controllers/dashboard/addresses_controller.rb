class Dashboard::AddressesController < UserController
  def new
    @address = current_user.addresses.new
  end

  def create
    @address = current_user.addresses.create(address_params)
    binding.pry
    if @address.save
      billing_or_shipping
      redirect_to new_order_path
    else
      render :new
    end
  end

  def update
    @address = current_user.addresses.find(params[:id])

    if @address.update(address_params)
      redirect_to edit_dashboard_user_path
    else
      render :edit
    end
  end

  private

  def billing_or_shipping
    if @address.shipping
      !@address.billing
    else
      @address.billing
    end
  end

  def address_params
    params.require(:address).permit(:street, :city, :state, :zip, :shipping)
  end
end
