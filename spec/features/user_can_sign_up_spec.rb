require 'rails_helper'

describe 'Creating and logging in a User', type: :feature do
  context 'An unregistered user' do
    it 'can sign up as a provider' do
      signup_provider

      expect(page).to have_content("Thanks, for registering!")
      expect(current_path).to eq(root_path)
    end

    it 'can sign up as a supplier' do
      signup(role: 'supplier')

      fill_in("Name", with: "Business")
      fill_in("Url", with: "business_thing")
      click_button("Create Supplier Account")

      expect(page).to have_content("Thanks, your request is pending!")
      expect(current_path).to eq(root_path)
    end

    it 'cannot login with an invalid password' do
      login

      expect(page.current_path).to eq(sessions_path)
    end
  end

  context 'A registered user' do
    it 'can log in as a provider' do
      signup_provider
      logout
      login

      expect(current_path).to eq(root_path)
    end

    it 'can log in as a supplier' do
      signup(role: 'supplier')

      fill_in("Name", with: "Business")
      fill_in("Url", with: "business_thing")
      click_button("Create Supplier Account")

      logout
      login

      expect(current_path).to eq(root_path)
    end

    it 'can logout after logging in' do
      signup_provider
      logout

      expect(page).to_not have_content('Sign Out')
    end

    it 'can log in after signing up' do
      signup_provider
      logout
      login

      expect(page).to have_content('Sign Out')
    end

    it 'can request a password reset' do
      signup
      logout

      visit signin_path
      click_on 'I Forgot My Password'
      fill_in 'Email', with: 'user@example.com'
      click_on 'Reset Password'

      expect(page).to have_content('You should receive an email soon with instructions for resetting your password.')
    end
  end
end
