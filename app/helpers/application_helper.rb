module ApplicationHelper
  def page_title(title)
    title.empty? ? 'Airlift' : title
  end


  def check_count
    @items.count > 0
  end

  def no_results
    p "No results have been found."
  end

  def calculate_total(cart_item, quantity)
    '$' + sprintf("%.2f", (quantity * cart_item.item.price) / 100.00)
  end

  def sort_categories(categories)
    categories.sort_by { |c| c.name }
  end

  def reduce_item_inventory(order)
    order.order_items.each do |order_item|
      item = order_item.item
      item.inventory -= (order_item.quantity * item.size.to_i)
      item.save
    end
  end

  def out_of_stock?(cart)
    cart.cart_items.any? do |cart_item|
      cart_item.item.inventory < (cart_item.quantity * cart_item.item.size.to_i)
    end
  end

  def get_item_out_of_stock(cart)
    cart.cart_items.detect do |cart_item|
      cart_item.item.inventory < (cart_item.quantity * cart_item.item.size.to_i)
    end
  end
end
