FactoryGirl.define do
  factory :user do
    full_name 'John Smith'
    email 'user@example.com'
    display_name 'John'
    role 'customer'
    password 'password'
    password_confirmation 'password'
  end
end
