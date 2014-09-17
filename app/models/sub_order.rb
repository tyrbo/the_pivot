class SubOrder < ActiveRecord::Base
  belongs_to :supplier
  belongs_to :order
  has_many :order_items
  has_many :items, through: :order_items

  def subtotal(item_id)
    self.item_quantity(item_id) * self.items.detect { |x| x.id == item_id }.price
  end
end
