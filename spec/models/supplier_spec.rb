require 'rails_helper'

RSpec.describe Supplier, :type => :model do

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:url) }

  it { should have_many(:suppliers_users) }
  it { should have_many(:users).through(:suppliers_users) }
end
