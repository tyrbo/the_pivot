require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe 'the header view', type: :feature do

  it 'expects the cart number to be one when a item is added' do
    item = Item.create(title: 'Key Lime', description: 'Yum',  price_pie: 50)
    page.visit item_path(item)
    page.click_on('ADD TO CART')
    page.visit items_path
    expect(page).to have_content(1)
  end

  it 'shows category index' do
    category = Category.create(name:'Cats')
    category.items.create(title:'items', description:'hihih')
    page.visit '/'
    expect(page).to have_content('Cats')
    page.click_on('Cats')
    expect(page).to have_content('items')
  end
end
