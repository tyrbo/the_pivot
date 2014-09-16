require 'rails_helper'

RSpec.describe CartItem, :type => :model do
  it { should belong_to(:item) }
  it { should belong_to(:cart) }

  it { should delegate_method(:price).to(:item) }
end
