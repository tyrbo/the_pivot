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
  validates :delivery_address_id, presence: true, if: :delivery?

  def self.status_counts
    result = self.group(:order_status).count  # select status, count(*) from Order group by status
    Status::ALL.each {|key| result[key] ||= 0}
    result
  end

  def self.all_count
    self.count
  end

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

  def get_subtotal(item_id)
    sprintf("%.2f", subtotal(item_id) / 100.00)
  end

  def suppliers
    suppliers = self.items.group_by(&:supplier_id)
  end

  def create_sub_orders

    suppliers.each do |supplier_id, items|
      sub =  SubOrder.create!(supplier_id: supplier_id,
                             order_id: self.id,
                             provider_name: self.user.full_name,
                             provider_email: self.user.email,
                             order_type: self.order_type,
                             status: self.order_status,
                             delivery_address_id: self.delivery_address_id,
                             billing_address_id: self.billing_address_id)
      supplier = Supplier.find(supplier_id)
      # SupplierRequestMailer.request_email(supplier).deliver if sub.save && supplier != nil
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

  def get_total
    '$' + sprintf("%.2f", order_total / 100.00)
  end

  def charge(token)
    begin
      charge = Stripe::Charge.create(
        :amount => order_total, # amount in cents, again
        :currency => "usd",
        :card => token,
        :description => user.email
      )
      update_attribute(:order_status, 'paid')
    rescue Stripe::CardError => e
      errors.add :base, "There was a problem with your credit card."
      return false
    end

    true
  end
end
