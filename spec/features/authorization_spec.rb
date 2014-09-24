require 'rails_helper'

describe 'authorization', type: :feature do
  let!(:user) { FactoryGirl.create(:user, role: 'supplier') }
  let!(:user2) { FactoryGirl.create(:user, email: "hacker@example.com") }
  let!(:order) { FactoryGirl.create(:order, user: user) }
  let!(:sub_order) { FactoryGirl.create(:sub_order, supplier: supplier)}
  let!(:supplier) { FactoryGirl.create(:supplier, users: [user]) }
  let!(:category) { FactoryGirl.create(:category) }
  let!(:item) { FactoryGirl.create(:item, supplier: supplier, categories: [category]) }

  before(:each) do
    login_as(username: user2.email)
  end

  def unauthorized?
    expect(current_path).to(eq(dashboard_root_path)) &&
      expect(page).to(have_content("You cannot access that resource."))
  end

  def unauthenticated?
    expect(current_path).to(eq(signin_path)) &&
      expect(page).to(have_content('You must be logged in to access that.'))
  end

  context 'for suppliers' do

    it 'cannot visit item management of other suppliers' do
      visit dashboard_supplier_items_path(supplier)

      expect(unauthorized?).to be true
    end

    it 'cannot visit order management of other suppliers' do
      visit dashboard_supplier_sub_orders_path(supplier)

      expect(unauthorized?).to be true
    end

    it 'cannot edit an item of other suppliers' do
      visit edit_dashboard_supplier_item_path(supplier, item)

      expect(unauthorized?).to be true
    end

    it 'cannot edit an order of other suppliers' do
      visit edit_dashboard_supplier_sub_order_path(supplier, sub_order)

      expect(unauthorized?).to be true
    end
  end

  context 'for users' do
    it 'cannot access the dashboard if not logged in' do
      logout
      visit dashboard_root_path

      expect(unauthenticated?).to be true
    end

    it 'cannot checkout if not logged in' do
      logout

      add_to_cart(item)

      find("#cart-button").click

      expect(page).to_not have_content('Enter Your Billing Info')
      expect(page).to have_content('You must sign in or register in order to checkout')
    end

    it 'cannot view orders if not logged in' do
      logout
      visit dashboard_order_path(order)

      expect(unauthenticated?).to be true
    end

    it 'cannot view orders it does not own' do
      visit dashboard_order_path(order)

      expect(unauthorized?).to be true
    end
  end
end
