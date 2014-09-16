class Order < ActiveRecord::Base

  class Status
    PAID      = "paid"
    CANCELLED = "cancelled"
    COMPLETED = "completed"
    ORDERED   = "ordered"

    ALL       = [PAID, CANCELLED, COMPLETED, ORDERED]
  end

  def self.status_counts
    result = Order.group(:order_status).count  # select status, count(*) from Order group by status
    Status::ALL.each {|key| result[key] ||= 0}
    result
  end

  def self.all_count
    Order.count
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

  def create_sub_orders
    suppliers = self.items.group_by(&:supplier_id)

    suppliers.each do |supplier_id, items|
      sub = SubOrder.create(supplier_id: supplier_id, order_id: self.id)

      items.each do |item|
        OrderItem.create(sub_order_id: sub.id, item: item, order: self)
      end

    end
  end

end
