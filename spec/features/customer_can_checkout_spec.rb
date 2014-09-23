require 'rails_helper'

describe 'A user with a cart & items', type: :feature do
  let!(:supplier) { FactoryGirl.create(:supplier)}
  let!(:keylime)  { supplier.items.create! title: 'key lime', description: "yum", price: 34 }

  before do
    signup
    add_to_cart(keylime)
    page.click_on('Cart')
  end

  it 'can get to checkout' do
    click_on('Checkout')
    expect(page).to have_content('Order Overview')
  end

  it 'can get order delivered' do
    select "Delivery", :from => "order[order_type]"
    fill_in('order[delivery_address]', with: '123 Main')
    click_on('Checkout')
    expect(page).to have_content('Order was successfully created')
    expect(page).to have_content('123 Main')
  end

  it 'can see it made previous orders' do
    click_on('Checkout')
    visit dashboard_root_path
    expect(page).to have_content('Your Orders')
  end
end
