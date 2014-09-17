require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe 'a user editing their account information', type: :feature do
  let!(:user) { User.create(full_name: "Rachel Warbelow", email: "demo+rachel@jumpstartlab.com", password: "password", role: :user, display_name: nil) }
  let!(:address) { Address.create(city: 'Denver', state: 'CO', zip: '80205', street: '1510 Blake St', shipping: true )}
  let!(:user_address) { UserAddress.create(user_id: user.id, address_id: address.id) }

  before(:each) do
    login_as(username: user.email, password: user.password)
    click_on 'Account'
  end

  context 'viewing account information' do

    it 'can visit account information page' do
      expect(current_path).to eq(user_path(user))
    end

    it 'displays user information on account page' do
      expect(page).to have_content(user.full_name)
      expect(page).to have_content(user.display_name)
      expect(page).to have_content(user.email)
    end

    it 'displays user addresses' do
      user.addresses.each do |address|
        expect(page).to have_content(address.city)
        expect(page).to have_content(address.state)
        expect(page).to have_content(address.zip)
        expect(page).to have_content(address.street)
      end
    end
  end

  context 'editing account information' do

    it 'can visit edit account information' do
      click_on 'Edit Account'
      expect(current_path).to eq(edit_user_path(user))
    end

    it 'can update personal information' do
      # click_on 'Edit'
      fill_in('Full name', with: 'rachelw')
      click_on 'Update'
      expect(current_path).to eq(edit_user_path(user))
      expect(page).to have_content('rachelw')
    end
  end
end
