require 'rails_helper'

describe 'Viewing the dashboard', type: :feature do
  context 'As a registered user' do
    let!(:user) { FactoryGirl.create(:user) }

    it 'Can see past orders' do
      order = FactoryGirl.create(:order, user: user)

      login_as(username: user.email, password: 'password')
      click_link 'Dashboard'

      expect(page).to have_content order.order_total
    end
  end
end
