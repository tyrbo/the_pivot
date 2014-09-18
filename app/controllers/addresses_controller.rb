class AddressesController < ApplicationController
  def update
    @address = Address.find(params[:id])

    if @address.update(address_params)
      redirect_to edit_user_path(current_user)
    else
      render :edit
    end
  end

  private

  def address_params
    params.require(:address).permit(:street, :city, :state, :zip, :shipping, :billing)
  end
end
