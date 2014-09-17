require 'rails_helper'

RSpec.describe UserAddress, type: :model do
  it { should belong_to(:user) }

  it { should belong_to(:address) }
end
