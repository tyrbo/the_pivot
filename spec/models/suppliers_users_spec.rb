require 'rails_helper'

RSpec.describe SuppliersUser, :type => :model do
 it { should belong_to(:user) }
 it { should belong_to(:supplier) }
end
