require 'rails_helper'

describe 'a supplier with info', type: :feature do
  let!(:user) { FactoryGirl.create(:user, role: 'supplier')}
  let!(:supplier) { FactoryGirl.create(:supplier, users: [user])}

  it 'sees info on supplier show page' do
    login_as(username: user.email, password: user.password)
    visit supplier_path(supplier)
    expect(page).to have_content('We sell things.')
  end

  xit 'can edit info on supplier show page' do
    login_as(username: user.email, password: user.password)
    click_on('Settings')

  end
end
