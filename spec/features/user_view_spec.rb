require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe 'user view', type: :feature do
  before(:each) do
    visit root_path
  end

  context 'unregistered user' do
    it 'unregistered user can register as supplier' do
      click_link_or_button('Register')
      fill_in("Full name", with: "John Doe")
      fill_in("Email", with: "redcross@example.com")
      fill_in("Display name", with: "redcross@example.com")
      fill_in("Password", with: "supplier123")
      fill_in("Confirmation", with: "supplier123")
      choose("user_role_supplier")
      click_button("Create Account")

      expect(page).to have_content("Thanks, your request is pending!")
      expect(current_path).to eq(root_path)
    end
  end
end
