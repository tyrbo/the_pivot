require './spec/features_helper'

describe 'user view', type: :feature do
  let(:supplier) { FactoryGirl.create(:supplier) }
  let(:supplier_user) { FactoryGirl.create(:user, suppliers: [supplier]) }
  let(:user) { FactoryGirl.create(:user) }

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

      fill_in("Name", with:"Business")
      fill_in("Url", with: "business_thing")
      click_button("Create Supplier Account")

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
      expect(current_path).to eq(dashboard_suppliers_path)

      expect(page).to have_link('Sign Out')
    end
  end

  context "as a provider" do
    it 'can login' do
      click_link('Sign In')
      login(user)
      expect(current_path).to eq(items_path)

      expect(page).to have_link('Sign Out')
    end
  end
end
