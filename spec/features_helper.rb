require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

def login(user)
  fill_in('Email', with: user.email)
  fill_in('Password', with: 'password')
  click_button('Sign in')
end
