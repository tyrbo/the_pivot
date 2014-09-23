require 'rails_helper'

describe 'a user viewing the cart page', type: :feature do

  let!(:category) { Category.create!(name: 'Something') }
  let!(:supplier) { FactoryGirl.create(:supplier) }
  let!(:keylime) { supplier.items.create!(title: 'Key Lime', description: 'Yummy',  inventory: 100, price: 30.00, categories: [category]) }

  xit 'can increase the quantity of an item by one' do
    page.visit items_path
    fill_in('quantity', with: 1)
    click_on('Add To Cart')
    visit cart_path
    expect(page).to have_content('Key Lime')
    fill_in('quantity', with: '2')
    click_on('Update')
    expect(page).to have_content(2)
  end

  xit 'can decrease the quantity of an item by one' do
    page.visit items_path
    click_on 'Add to Cart'
    click_on 'Submit'
    visit cart_path
    click_on '+'
    expect(page).to have_content(2)
    click_on '-'
    visit cart_path
    expect(page).to have_content(1)
  end

  xit 'can delete an item by setting quantity to zero' do
    pending
    page.visit items_path
    click_on 'Add to Cart'
    click_on 'Submit'
    visit cart_path
    expect(page).to have_content('Key Lime')
    click_on '-'
    visit cart_path
    expect(page).to_not have_content('Key Lime')
  end
end
