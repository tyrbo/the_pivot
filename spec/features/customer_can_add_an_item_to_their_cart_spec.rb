require 'rails_helper'

describe 'a user viewing the items page', type: :feature do
  let(:keylime)  { Item.create! title: 'Key Lime', description: "yum", price: 34 }
  let(:apple)    { Item.create! title: 'Apple', description: "delicious",  price: 29 }

  context 'Unauthenticated Customer' do
    it 'adds item' do
      add_to_cart(keylime)
      visit cart_path

      expect(page).to have_content(1)
      expect(page).to have_content(keylime.title)
      expect(page).to have_content(keylime.price)
    end

    it 'adds two of the same item' do
      add_to_cart(keylime, count: 2)
      visit cart_path

      expect(page).to have_content(keylime.title)
      expect(page).to have_content(68)
      expect(page).to have_content(2)
    end

    it 'has two of the same item and item name only appears once' do
      add_to_cart(keylime, count: 2)
      visit cart_path

      expect(page).to_not have_css('.item_title:nth-of-type(2)')
    end

    it 'displays correct price for many items' do
      add_to_cart(keylime)
      add_to_cart(apple)
      visit cart_path

      expect(page).to have_content(keylime.title)
      expect(page).to have_content(34)
      expect(page).to have_content(apple.title)
      expect(page).to have_content(29)
    end

    it 'can find the total price of an order' do
      add_to_cart(apple)
      add_to_cart(keylime)
      visit cart_path

      expect(page).to have_content(63)
    end
  end
end
