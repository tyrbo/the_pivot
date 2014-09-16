class Cart < ActiveRecord::Base
	# This holds our items until checkout
	# How can we make this hold our items
	# How can we just add one item to the cart
	# So we click on an item
	# It adds that item to our cart
	# and it saves it
	has_many :cart_items
	has_many :items, through: :cart_items

	def create_order_items(order)
		self.items.each do |item|
			order.order_items.create(item:item)
		end
	end
end
