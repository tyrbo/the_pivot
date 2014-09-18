class Order < ActiveRecord::Base

  class Status
    PAID      = "paid"
    CANCELLED = "cancelled"
    COMPLETED = "completed"
    ORDERED   = "ordered"

    ALL       = [PAID, CANCELLED, COMPLETED, ORDERED]
  end

  has_many    :order_items
  has_many    :items, through: :order_items
  belongs_to  :user
  has_many    :sub_orders

  validates :order_total,      presence: true
  validates :order_type,       presence: true
  validates :delivery_address, presence: true, if: :delivery?

  def delivery?
    order_type == "delivery"
  end

  def cancelled?
    order_status == "cancelled"
  end

  def ordered?
    order_status == "ordered"
  end

  def paid?
    order_status == "paid"
  end

  def complete?
    order_status == 'completed'
  end

  def item_quantity(item_id)
    self.items.count { |i| i.id == item_id }
  end

  def subtotal(item_id)
    self.item_quantity(item_id) * self.items.detect { |x| x.id == item_id }.price
  end

  def suppliers
    suppliers = self.items.group_by(&:supplier_id)
  end

  def create_sub_orders
    suppliers.each do |supplier_id, items|
      sub =  SubOrder.create(supplier_id: supplier_id,
                                order_id: self.id,
                           provider_name: self.user.full_name,
                          provider_email: self.user.email,
                              order_type: self.order_type,
                                  status: self.order_status)
      sub.save
      update_order_items(sub, items)
    end
  end

  def update_order_items(sub, items)
    items.each do |item|
      order_item = self.order_items.find_by(item_id: item.id, sub_order_id: nil)
      sub.order_items << order_item
      sub.save
    end
  end
end
