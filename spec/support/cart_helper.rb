def add_to_cart(item, count: 1)
  count.times do
    page.visit item_path(item)
    page.fill_in('quantity', with: 1)
    page.click_on('Add To Cart')
  end
end
