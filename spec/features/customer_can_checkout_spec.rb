require 'rails_helper'

describe 'A user with a cart & items', type: :feature do
  let!(:supplier) { FactoryGirl.create(:supplier)}
  let!(:keylime)  { supplier.items.create! title: 'key lime', description: "yum", price: 34 }
  let(:user) {FactoryGirl.create(:user, addresses: [address1, address2])}
  let(:address1) { FactoryGirl.create(:address, shipping: true, billing: false)}
  let(:address2) { FactoryGirl.create(:address, shipping: false, billing: true)}

  before do
    login_as(username: user.email, password: user.password)
    add_to_cart(keylime)
    find("#cart-button").click
  end

  it 'redirects to checkout page after being forced to log in' do
    logout
    find("#cart-button").click
    click_on('Continue to Checkout')

    expect(current_path).to eq signin_path

    fill_in('Email', with: user.email)
    fill_in('Password', with: user.password)
    click_button('Sign in')

    expect(current_path).to eq new_order_path
  end

  it 'can get to checkout' do
    click_on('Continue to Checkout')
    expect(page).to have_content('Order Overview')
    expect(page).to have_content(keylime)
  end

  it 'can get order delivered to saved address' do
    click_on('Continue to Checkout')
    choose "order[order_type]", :option  =>"Delivery"
    choose "order[delivery_address_id]", :option => 1
    choose "order[billing_address_id]", :option => 2
    click_on('Place Order')
    expect(page).to have_content('Order was successfully created')
    expect(page).to have_content('123 Main Denver CO')
  end

  it 'can see it made previous orders' do
    click_on('Checkout')
    visit dashboard_root_path
    expect(page).to have_content('Your Orders')
  end
end
