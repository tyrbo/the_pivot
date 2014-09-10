require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'


describe 'a user viewing the cart page', type: :feature do

  let(:category) { Category.create!(name: 'Something') }
  let(:keylime) { Item.create!(title: 'Key Lime', description: 'Yummy',  price_pie: 30.00, categories: [category]) }

  it 'can increase the quantity of an item by one' do
    keylime
    page.visit items_path
    click_on 'Add To Cart'
    visit cart_path
    click_on '+'
    visit cart_path
    expect(page).to have_content(2)
  end

  it 'can decrease the quantity of an item by one' do
    keylime
    page.visit items_path
    click_on 'Add To Cart'
    visit cart_path
    click_on '+'
    expect(page).to have_content(2)
    click_on '-'
    visit cart_path
    expect(page).to have_content(1)
  end

  it 'can delete an item by setting quantity to zero' do
    keylime
    page.visit items_path
    click_on 'Add To Cart'
    visit cart_path
    expect(page).to have_content('Key Lime')
    click_on '-'
    visit cart_path
    expect(page).to_not have_content('Key Lime')
  end
end
