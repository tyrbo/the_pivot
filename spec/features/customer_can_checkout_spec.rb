require 'rails_helper'

describe 'A user with a cart & items', type: :feature do
  let!(:supplier) { FactoryGirl.create(:supplier) }
  let!(:keylime)  { supplier.items.create! title: 'key lime', description: "yum", price: 34 }

  before do
    signup
    add_to_cart(keylime)
  end

  xit 'can get to checkout' do
    click_on('Checkout')
    expect(page).to have_content('Order Overview')
  end

  xit 'can get order delivered' do
    select "Delivery", :from => "order[order_type]"
    fill_in('order[delivery_address]', with: '123 Main')
    click_on('Checkout')
    expect(page).to have_content('Order was successfully created')
    expect(page).to have_content('123 Main')
  end

  xit 'can see it made previous orders' do
    click_on('Checkout')
    visit '/users/1'
    expect(page).to have_content('Previous Orders')
  end
end
