require 'rails_helper'

describe 'authorization', type: :feature do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:user2) { FactoryGirl.create(:user, email: "hacker@example.com") }
  let!(:sub_order) { FactoryGirl.create(:sub_order, supplier: supplier)}
  let!(:supplier) { FactoryGirl.create(:supplier, users: [user]) }
  let!(:item) { FactoryGirl.create(:item, supplier: supplier) }

  def no_access?
    expect(current_path).to(eq(dashboard_root_path)) && expect(page).to(have_content("You cannot access that resource."))
  end

  context 'for suppliers' do
    before(:each) do
      login_as(username: user2.email)
    end

    it 'cannot visit item management of other suppliers' do
      visit dashboard_supplier_items_path(supplier)

      expect(no_access?).to be true
    end

    it 'cannot visit order management of other suppliers' do
      visit dashboard_supplier_sub_orders_path(supplier)

      expect(no_access?).to be true
    end

    it 'cannot edit an item of other suppliers' do
      visit edit_dashboard_supplier_item_path(supplier, item)

      expect(no_access?).to be true
    end

    it 'cannot edit an order of other suppliers' do
      visit edit_dashboard_supplier_sub_order_path(supplier, sub_order)

      expect(no_access?).to be true
    end
  end


end
