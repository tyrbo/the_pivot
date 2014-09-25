class CartsController < ApplicationController
	def show
		@cart = cart
		session[:last_page] = request.path unless current_user
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

		if params[:supplier_id]
			supplier = Supplier.find(params[:supplier_id])
			redirect_to supplier_path(supplier, item_name: item.title, item_picture: item.picture)
		else
			redirect_to items_path(item_name: item.title, item_picture: item.picture)
		end
	end

	def update
		@cart = cart
		cart_item = @cart.cart_items.find(params[:id])
		if params[:quantity] == "0"
			cart_item.destroy
		else
			cart_item.update_attribute(:quantity, params[:quantity])
		end
		redirect_to cart_path, notice: "#{cart_item.item.title} quantity updated!"
	end

	def destroy
		cart_item = @cart.cart_items.find(params[:id])
		cart_item.destroy
		redirect_to cart_path
	end


end
