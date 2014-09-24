require 'rails_helper'

describe 'a supplier', type: :feature do

  let!(:user) { FactoryGirl.create(:user) }
  let!(:user1) { FactoryGirl.create(:user, email: 'bob@example.com') }
  let!(:supplier) { FactoryGirl.create(:supplier, users: [user]) }

  before do
    supplier.pending_users << user1

    login_as(username: user.email, password: user.password)
    visit dashboard_root_path
    click_on('Users')
  end

  it 'can see pending admins' do
    expect(page).to have_content('bob@example.com')
  end

  it 'can add pending admins' do
    click_on('Add As Admin')
    within('.admins') do
      expect(page).to have_content('bob@example.com')
    end
    within('.pending') do
      expect(page).to_not have_content('bob@example.com')
    end
  end

  it 'can remove admins' do
    click_on('Add As Admin')
    click_on('Remove Admin')
    expect(page).to_not have_content('bob@example.com')
    expect(User.count).to eq(2)
  end

  it 'can remove pending admins' do
    click_on('Remove Pending Admin')
    expect(page).to_not have_content('bob@example.com')
    expect(User.count).to eq(2)
  end

end
