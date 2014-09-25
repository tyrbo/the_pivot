class CartItem < ActiveRecord::Base
	belongs_to :item
	belongs_to :cart

	delegate :price, to: :item


	def price
		if self.quantity != nil
			self.quantity * self.item.price
		else
			0
		end
	end

	def total_price
		'$' + sprintf("%.2f", price / 100.00)
	end
end
