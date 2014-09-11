require 'rails_helper'

describe 'A user', type: :feature do
  before(:each) do
    user = User.create(full_name: 'A Supplier', email: 'a@a.com', password: 'password', password_confirmation: 'password', role: 'supplier')
    category = Category.create(name: 'A Category')
    Item.create(title: 'An Item', description: 'This is a useful item.', price_pie: 12.50, categories: [category], user: user)
  end

  it 'can view all the suppliers' do
    visit suppliers_path
    expect(page).to have_content 'A Supplier'
  end

  it 'can view an individual supplier' do
    visit suppliers_path
    click_link 'A Supplier'
    expect(page).to have_content 'A Supplier'
    expect(page).to have_content 'An Item'
    expect(page).to have_content 'This is a useful item.'
    expect(page).to have_content '12.5'
  end
end
