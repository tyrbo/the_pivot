def add_to_cart(item, count: 1)
  count.times do
    page.visit item_path(item)
    page.click_on('Add To Cart')
  end
end
