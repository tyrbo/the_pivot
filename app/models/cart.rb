class Cart < ActiveRecord::Base
	has_many :cart_items
	has_many :items, through: :cart_items

	def total
		cart_items.reduce(0) { |total, cart_item| total += cart_item.item.price }
	end

	def create_order_items(order)
		self.items.each do |item|
			order.order_items.create(item:item)
		end
	end
end
