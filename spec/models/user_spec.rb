require 'rails_helper'

RSpec.describe User, :type => :model do
  it { should have_many(:suppliers_users) }
  it { should have_many(:suppliers).through(:suppliers_users) }
  it { should have_many(:orders) }
  
  it { should validate_presence_of(:full_name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:role) }
  it { should validate_presence_of(:password) }

  it { should validate_uniqueness_of(:email) }

  it { should validate_confirmation_of(:password) }

  it { should ensure_length_of(:full_name).is_at_most(50) }
  it { should ensure_length_of(:email).is_at_most(50) }
  it { should ensure_length_of(:password).is_at_least(6).is_at_most(40) }

  it { should allow_value('test@example.com', 'hello@test.gg').for(:email) }
  it { should_not allow_value('fake@fake', 'faker').for(:email) }

  it { should have_secure_password }
end
