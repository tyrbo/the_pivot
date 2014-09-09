require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe 'A user with a cart & items', type: :feature do
  def signup
    visit '/signup'
    fill_in('user[full_name]', with: 'Tom Smith')
    fill_in('user[email]', with: 'tom@example.com')
    fill_in('user[display_name]', with: 'Tommy')
    fill_in('user[password]', with: 'password')
    fill_in('user[password_confirmation]', with: 'password')
    click_on('Create Account')
  end

  let(:keylime)  { Item.create! title: 'key lime', description: "yum", price_pie: 34 }

  def add_to_cart
    page.visit item_path(keylime)
    page.click_on('ADD TO CART')
    visit cart_path
  end

  before do
    signup
    add_to_cart
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
    visit '/users/1'
    expect(page).to have_content('Previous Orders')
  end
end
