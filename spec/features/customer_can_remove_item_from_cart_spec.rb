require 'rails_helper'

describe 'a user view the cart', type: :feature do
  let!(:category) { FactoryGirl.create(:category) }
  let!(:supplier) { FactoryGirl.create(:supplier) }
  let(:keylime)  { Item.create! title: 'Key Lime', description: "yum", price: 34, category_ids: [category.id], supplier_id: supplier.id, size: '1', inventory: 1000 }
  let(:apple)    { Item.create! title: 'Apple', description: "delicious",  price: 29, category_ids: [category.id], supplier_id: supplier.id, size: '1', inventory: 1000 }

  context 'user' do
    it 'adds item to cart' do
      add_to_cart(keylime)
      visit cart_path

      expect(page).to have_content(1)
      expect(page).to have_content(keylime.title)
      expect(page).to have_content(keylime.format_price)
    end

    it 'removes the item from cart' do
      add_to_cart(keylime)
      visit cart_path
      find('#remove-from-cart').click

      visit cart_path
      expect(page).to_not have_content(keylime.title)
      expect(page).to_not have_content(keylime.format_price)
    end

  end
end
