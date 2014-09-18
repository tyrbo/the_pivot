require 'rails_helper'

describe 'a supplier viewing the items page', type: :feature do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:user2) { FactoryGirl.create(:user, email: "hacker@example.com") }
  let!(:supplier) { FactoryGirl.create(:supplier, users: [user]) }
  let!(:item) { FactoryGirl.create(:item, supplier: supplier) }


  context "supplier user functionality" do
    before(:each) do
      login

      page.click_link('Item Management')
    end

    it 'can show an item' do
      page.click_link('Show')

      expect(page.current_path).to eq dashboard_supplier_item_path(supplier.id, item.id)
    end

    it 'can only see items that belongs to self' do
      item = FactoryGirl.create(:item, title: 'Hello', supplier: nil)

      visit dashboard_root_path
      page.click_link('Item Management')

      expect(page).to_not have_content item.title
    end

    it 'can destroy an item' do
      expect(page).to have_content("Yummy")

      page.click_link('Destroy')

      expect(page).to_not have_content("Yummy")
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

      expect(page.current_path).to eq dashboard_supplier_item_path(supplier.id, item.id)
      expect(page).to have_content('Allie')
    end

    it 'can retire an item' do
      page.click_link('Retire')

      expect(page.current_path).to eq dashboard_supplier_items_path(supplier.id)
      expect(page).to have_content('Unretire')
    end

    it 'can unretire an item' do
      page.click_link('Retire')
      page.click_link('Unretire')

      expect(page).to have_content('Retire')
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
