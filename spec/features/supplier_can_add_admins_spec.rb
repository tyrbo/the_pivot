require 'rails_helper'

describe 'a supplier', type: :feature do

  let!(:user) { FactoryGirl.create(:user)}
  let!(:supplier) { FactoryGirl.create(:supplier, users: [user])}
  let!(:user) { FactoryGirl.create(:user, email: 'bob@example.com')}

  it 'can see a approve made to become admin' do
    login
    visit dashboard_root_path
    click_on('Admin Management')
    expect(page).to have_content('bob@example.com')
    expect(page).to have_content('pending')
    click_on('Approve')
    expect(page).to have_content('admin')
  end
end
