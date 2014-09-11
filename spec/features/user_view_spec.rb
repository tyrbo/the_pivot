require './spec/features_helper'

describe 'user view', type: :feature do
  let(:supplier_user) { User.create(full_name: 'Jane Doe', email: 'jane@email.com', password: 'password', password_confirmation: 'password', role: 'supplier' )}
  let(:provider_user) { User.create(full_name: 'Joe Doe', email: 'joe@email.com', password: 'password', password_confirmation: 'password', role: 'provider' )}


  before(:each) do
    visit root_path
  end

  context 'unregistered user' do
    it 'unregistered user can register as supplier' do
      click_link_or_button('Sign Up')
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

    it 'unregistered user can register as a provider' do
      click_link_or_button('Sign Up')
      fill_in("Full name", with: "Chad Brading")
      fill_in("Email", with: "chad@example.com")
      fill_in("Display name", with: "chad@example.com")
      fill_in("Password", with: "provider123")
      fill_in("Confirmation", with: "provider123")
      choose("user_role_provider")
      click_button("Create Account")

      expect(page).to have_content("Thanks, for registering!")
      expect(current_path).to eq(root_path)
    end
  end

  context "as a registered supplier" do
    it 'can login' do
      click_link('Sign In')
      login(supplier_user)
      expect(current_path).to eq(supplier_dashboard_path)

      expect(page).to have_link('Sign Out')
    end
  end

  context "as a provider" do
    it 'can login' do
      click_link('Sign In')
      login(provider_user)
      expect(current_path).to eq(items_path)

      expect(page).to have_link('Sign Out')
    end
  end
end
