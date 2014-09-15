def login_as(username: 'user@example.com', password: 'password')
  visit root_path
  click_link 'Sign In'
  fill_in('Email', with: username)
  fill_in('Password', with: password)
  click_button('Sign in')
end
