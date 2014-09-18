require 'rails_helper'

describe 'Viewing the dashboard', type: :feature do
  context 'As a registered user' do
    let!(:user) { FactoryGirl.create(:user) }
    let!(:order) { FactoryGirl.create(:order, user: user) }

    before(:each) do
      login
      click_link 'Dashboard'
    end

    it 'Can see past orders' do
      expect(page).to have_content order.get_total
    end

    it 'can link to individual orders' do
      click_link 'View Order Details'

      expect(current_path).to eq(order_path(order))
    end

    it 'shows supplier for each item on details page' do
      click_link 'View Order Details'

      within('#order-items-header') do
        expect(page).to have_content('Supplier')
      end
    end
  end
end
