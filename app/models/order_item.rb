class OrderItem < ActiveRecord::Base
	belongs_to :order
	belongs_to :item
	belongs_to :sub_order
	before_create :set_quantity

	def set_quantity
		self.quantity = 1
	end

	def subtotal
		self.quantity * self.item.price
	end
end
