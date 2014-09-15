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

    it 'can link to individual orders' do
      order = FactoryGirl.create(:order, user: user)

      login_as(username: user.email, password: 'password')
      click_link 'Dashboard'
      click_link 'View Order Details'

      expect(current_path).to eq(order_path(order))
    end

    it 'shows supplier for each item on details page' do
      order = FactoryGirl.create(:order, user: user)

      login_as(username: user.email, password: 'password')
      click_link 'Dashboard'
      click_link 'View Order Details'
      within('#order-items-header') do
        expect(page).to have_content('Supplier')
      end
    end
  end
end
