require 'rails_helper'

RSpec.describe Address, type: :model do
  it { should validate_presence_of(:city) }

  it { should validate_presence_of(:state) }

  it { should validate_presence_of(:zip) }

  it { should validate_presence_of(:street) }

  it {should have_many(:user_addresses) }
  it { should have_many(:users).through(:user_addresses) }
end
