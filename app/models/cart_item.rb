class CartItem < ActiveRecord::Base
	belongs_to :item
	belongs_to :cart

	delegate :price, to: :item

	def price
		self.quantity * self.item.price
	end

	def total_price
		'$' + sprintf("%.2f", price / 100.00)
	end
end
