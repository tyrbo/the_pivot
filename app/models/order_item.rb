class OrderItem < ActiveRecord::Base
	belongs_to :order
	belongs_to :item
	belongs_to :sub_order
	before_create :set_quantity, :set_price

	def set_quantity
		self.quantity = 1
	end

	def set_price
		if self.price == nil
			self.price = 0
		else
			self.price
		end
	end

	def subtotal
		if self.item && self.quantity
			self.quantity * self.price
		else
			0.00
		end
	end

	def get_price
		'$' + sprintf("%.2f", price / 100.00)
	end

	def get_subtotal
		'$' + sprintf("%.2f", subtotal / 100.00)
	end

	def edit_price
		get_price.gsub("$", '')
	end
end
