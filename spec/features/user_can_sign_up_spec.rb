require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe 'A unregistered User', type: :feature do

  it 'can sign up' do
    visit '/signup'
    fill_in('user[full_name]', with: 'Tom Smith')
    fill_in('user[email]', with: 'tom@example.com')
    fill_in('user[display_name]', with: 'Tommy')
    fill_in('user[password]', with: 'password')
    fill_in('user[password_confirmation]', with: 'password')
    click_on('Create Account')
    visit user_path(User.last)
    expect(page).to have_content('Previous Orders')
    expect(page).to have_content('Tommy')
  end

  it 'cannot login' do
    visit '/signin'
    fill_in('session[email]', with: 'tom@example.com')
    fill_in('session[password]', with: 'password')
    click_button('Sign in')
    expect(page.current_path).to eq(sessions_path)
  end
end

describe 'A registered User', type: :feature do

  def signup
    visit '/signup'
    fill_in('user[full_name]', with: 'Tom Smith')
    fill_in('user[email]', with: 'tom@example.com')
    fill_in('user[display_name]', with: 'Tommy')
    fill_in('user[password]', with: 'password')
    fill_in('user[password_confirmation]', with: 'password')
    click_on('Create Account')
  end

  it 'can logout after logging in' do
    signup
    visit user_path(User.last)
    expect(page).to have_content('Previous Orders')
    click_on('Sign Out')
    expect(page).to_not have_content('Sign Out')
  end

  it 'can log in after signing up' do
    signup
    click_on('Sign Out')

    visit '/signin'
    fill_in('session[email]', with: 'tom@example.com')
    fill_in('session[password]', with: 'password')
    click_button('Sign in')
    visit user_path(User.last)
    expect(page).to have_content('Previous Orders')
  end

end
