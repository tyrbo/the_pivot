class SubOrder < ActiveRecord::Base
  belongs_to :supplier
  belongs_to :order
  has_many :order_items
  has_many :items, through: :order_items

  def total
    self.order_items.reduce(0) do |sum, order_item|
      sum += (order_item.quantity * order_item.item.price)
    end
  end
end
