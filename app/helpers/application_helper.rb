module ApplicationHelper
  def page_title(title)
    title.empty? ? 'Airlift' : title
  end


  def check_count?
    @items.count > 0
  end

  def calculate_total(cart_item, quantity)
    '$' + sprintf("%.2f", (quantity * cart_item.item.price) / 100.00)
  end
end
