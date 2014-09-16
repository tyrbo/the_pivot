def login
  login_as
end

def login_as(username: 'user@example.com', password: 'password')
  visit root_path
  click_link 'Sign In'
  fill_in('Email', with: username)
  fill_in('Password', with: password)
  click_button('Sign in')
end

def logout
  click_link 'Sign Out'
end

def signup(full_name: 'Tom Smith', email: 'user@example.com', display_name: 'Tommy', password: 'password', role: 'provider')
  visit '/signup'
  fill_in('user[full_name]', with: full_name)
  fill_in('user[email]', with: email)
  fill_in('user[display_name]', with: display_name)
  fill_in('user[password]', with: password)
  fill_in('user[password_confirmation]', with: password)
  choose("user_role_#{role}")
  click_on('Create Account')
end
