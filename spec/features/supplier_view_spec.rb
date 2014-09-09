require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe 'a supplier viewing the items page', type: :feature do
  let(:user) do
    User.create!(:full_name   => "john doe",
                :email        => "john_doe@example.com",
                :display_name => "john_doe_123",
                :role         => "supplier",
                :password     => 'password')
  end

  context "supplier user functionality" do
    it 'can login with the correct information' do
      page.visit signin_path
      page.fill_in('session[email]',    with: user.email)
      page.fill_in('session[password]', with: 'password')
      page.click_button('Sign in')
      expect(page.current_path).to eq(supplier_dashboard_path)
    end

    def login
      page.visit signin_path
      page.fill_in('session[email]',    with: user.email)
      page.fill_in('session[password]', with: 'password')
      page.click_button('Sign in')
    end

    it 'can show an item' do
      item = Item.create!(title: "Cami's", inventory: 12, price_pie: 30.99,
                          description: "yummy")
      login
      page.click_link('Menu Item Management')
      page.click_link('Show')
      expect(page.current_path).to eq('/supplier/items/1')
    end

    it 'can destroy an item' do
      item = Item.create!(title: "Cami's", inventory: 12, price_pie: 30.99,
                          description: "yummy")

      login
      page.click_link('Menu Item Management')
      expect(page).to have_content("yummy")
      page.click_link('Destroy')
      expect(page).to_not have_content("yummy")
    end

    it 'can add an item' do
      login
      page.click_link('Menu Item Management')
      page.click_link('Create a New Item')
      expect(page).to have_content('New Pie')
      fill_in('item[title]', with: 'Item')
      fill_in('item[description]', with: 'Description')
      fill_in('item[price_pie]', with: '100')
      click_on('Save Changes')
      expect(page).to have_content('Pie Name')
      expect(page).to have_content('Item')
    end

    it 'can edit an item' do
      item = Item.create!(title: "Cami's", inventory: 12, price_pie: 30.99,
                          description: "yummy")
      login
      page.click_link('Menu Item Management')
      page.click_link('Edit')
      expect(page).to have_content('Editing: Cami\'s')
      fill_in('item[title]', with: 'Allie')
      click_on('Save Changes')
      expect(page.current_path).to eq('/supplier/items/1')
      expect(page).to have_content('Allie')
    end

    it 'can retire an item' do
      item = Item.create!(title: "Cami's", inventory: 12, price_pie: 30.99,
                          description: "yummy")
      login
      page.click_link('Menu Item Management')
      page.click_link('Retire')
      expect(page.current_path).to eq('/supplier/items')
      expect(page).to have_content('Unretire')
    end

    it 'can unretire an item' do
      item = Item.create!(title: "Cami's", inventory: 12, price_pie: 30.99,
                          description: "yummy")
      login
      page.click_link('Menu Item Management')
      page.click_link('Retire')
      page.click_link('Unretire')
      expect(page).to have_content('Retire')
    end
  end
end
