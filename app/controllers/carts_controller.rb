class CartsController < ApplicationController
	def show
		@cart = cart
	end

	def add_to_cart_view
		item = Item.find(params[:item_id])
    qty = params[:quantity].to_i
    qty.times do
      cart.items << item
    end
		redirect_to items_path
	end
end
