class OrderItem < ActiveRecord::Base
	belongs_to :order
	belongs_to :item
	belongs_to :sub_order
	before_create :set_quantity

	def set_quantity
		self.quantity = 1
	end

	def subtotal
		if self.item && self.quantity
			self.quantity * self.item.price
		else
			0.00
		end
	end
end
