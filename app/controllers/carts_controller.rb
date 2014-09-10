class CartsController < ApplicationController
	def show
		@cart = cart
	end

	def add_to_cart_view
		item = Item.find(params[:item_id])
		cart.items << item
		redirect_to items_path
	end
end
