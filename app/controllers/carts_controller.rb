class CartsController < ApplicationController
	def show
		@cart = cart
	end

	def add_to_cart_view
		item = Item.find(params[:item_id])
		qty = params[:quantity].to_i
		if cart.items.include?(item)
			items = cart.cart_items.find_by(item_id: item)
			items.quantity += qty
			items.save
		else
			cart.cart_items.create(item_id: item.id, quantity: qty )
		end
		redirect_to items_path
	end

	def update
		@cart = cart
		cart_item = @cart.cart_items.find(params[:id])
		cart_item.update_attribute(:quantity, params[:quantity])
		redirect_to cart_path, notice: "#{cart_item.item.title} quantity updated!"
	end

end
