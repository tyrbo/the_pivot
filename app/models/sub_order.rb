class SubOrder < ActiveRecord::Base
  belongs_to :supplier
  belongs_to :order
  has_many :order_items
  has_many :items, through: :order_items
end
