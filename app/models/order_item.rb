class OrderItem < ActiveRecord::Base
	belongs_to :order
	belongs_to :item
	belongs_to :sub_order
end
