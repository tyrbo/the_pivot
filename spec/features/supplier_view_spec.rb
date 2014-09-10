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
      visit signin_path
      fill_in('session[email]',    with: user.email)
      fill_in('session[password]', with: 'password')
      click_button('Sign in')
      expect(current_path).to eq(supplier_dashboard_path)
    end

    it 'can destroy an item' do
      item = Item.create!(title: "Cami's", inventory: 12, price_pie: 30.99,
                          description: "yummy")

      visit signin_path
      fill_in('session[email]',    with: user.email)
      fill_in('session[password]', with: 'password')
      click_button('Sign in')
      click_link('Menu Item Management')
      expect(page).to have_content("yummy")
      click_link('Destroy')
      expect(page).to_not have_content("yummy")
    end
  end
end
