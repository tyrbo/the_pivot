require 'rails_helper'

describe 'a supplier', type: :feature do

  let!(:user) { FactoryGirl.create(:user, role: 'supplier')}
  let!(:supplier) { FactoryGirl.create(:supplier, users: [user, user1])}
  let!(:user1) { FactoryGirl.create(:user, email: 'bob@example.com', role:'pending')}

  it 'can see a approve made to become admin' do
    login_as(username: user.email, password: user.password)
    visit dashboard_root_path
    click_on('Admin Management')
    expect(page).to have_content('bob@example.com')
    click_on('Add')
  end
end
