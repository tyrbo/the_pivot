require 'rails_helper'

describe 'a supplier viewing the items page', type: :feature do
  let!(:user) { FactoryGirl.create(:user, role: 'supplier') }
  let!(:user2) { FactoryGirl.create(:user, email: "hacker@example.com") }
  let!(:supplier) { FactoryGirl.create(:supplier, users: [user]) }
  let!(:item) { FactoryGirl.create(:item, supplier: supplier) }


  context "supplier user functionality" do
    before(:each) do
      login
      visit dashboard_root_path
      page.click_link('Listings')
    end

    it 'can show an item' do
      page.click_link('Show')

      expect(page.current_path).to eq dashboard_supplier_item_path(supplier.url, item.id)
    end

    it 'can only see items that belongs to self' do
      item = FactoryGirl.create(:item, title: 'Hello', supplier: nil)

      visit dashboard_root_path
      page.click_link('Listings')

      expect(page).to_not have_content item.title
    end

    it 'can add an item' do
      page.click_link('Create a New Item')

      expect(page).to have_content('New Item')

      fill_in('item[title]', with: 'Item')
      fill_in('item[description]', with: 'Description')
      fill_in('item[price]', with: '100')
      click_on('Save Changes')

      expect(page).to have_content('Item')
      expect(Item.last.supplier_id).to eq supplier.id
    end

    it 'can edit an item' do
      page.click_link('Edit')

      expect(page).to have_content('Editing: Cami\'s')

      fill_in('item[title]', with: 'Allie')
      click_on('Save Changes')

      expect(page.current_path).to eq dashboard_supplier_item_path(supplier.url, item.id)
      expect(page).to have_content('Allie')
    end

    it 'can retire an item' do
      page.click_link('Remove')

      expect(page.current_path).to eq dashboard_supplier_items_path(supplier.url)
      expect(page).to have_content('Activate')
    end

    it 'can unretire an item' do
      page.click_link('Remove')
      page.click_link('Activate')

      expect(page).to have_content('Remove')
    end
  end

  context 'unauthorized user' do
    it 'cannot visit item management of other suppliers' do
      login_as(username: user2.email)
      visit dashboard_supplier_items_path(supplier)

      expect(current_path).to eq(dashboard_root_path)
      expect(page).to have_content("You cannot access that resource.")
    end
  end
end
