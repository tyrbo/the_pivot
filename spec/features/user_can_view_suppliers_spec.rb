require 'rails_helper'

describe 'A user', type: :feature do
  before(:each) do
    @user = User.create(full_name: "Supplier Name", display_name: "A Supplier", email: 'a@a.com', password: 'password', password_confirmation: 'password', role: 'supplier')
    category = Category.create(name: 'A Category')
    @user.items.create(title: 'An Item', description: 'This is a useful item.', price: 12.50, categories: [category])
  end

  it 'can view all the suppliers' do
    visit suppliers_path
    expect(page).to have_content @user.display_name
  end

  it 'can view an individual supplier' do
    visit supplier_path(@user)
    expect(page).to have_content @user.display_name
    expect(page).to have_content @user.items.first.title
    expect(page).to have_content @user.items.first.description
  end
end
