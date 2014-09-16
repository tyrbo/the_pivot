class Cart < ActiveRecord::Base
	has_many :cart_items
	has_many :items, through: :cart_items

	def create_order_items(order)
		self.items.each do |item|
			order.order_items.create(item:item)
		end
	end
end
