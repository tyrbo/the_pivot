class Cart < ActiveRecord::Base
	has_many :cart_items
	has_many :items, through: :cart_items

	def total
		cart_items.reduce(0) { |total, cart_item| total += cart_item.item.price }
	end

	def cart_item_quantity
		self.items.uniq.count
	end

	def create_order_items(order)
		self.items.each do |item|
			if order.order_items.any?{ |o| o.item_id == item.id}
				add_to_quantity(order, item)
			else
				order.order_items.create(item:item, price: item.price)
			end
		end
	end

	def add_to_quantity(order, item)
		order_item = order.order_items.find_by(item_id: item.id)
		order_item.quantity += 1
		order_item.save
	end

	def get_total
		'$' + sprintf("%.2f", total / 100.00)
	end
end
