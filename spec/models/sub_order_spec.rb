require 'rails_helper'

RSpec.describe SubOrder, :type => :model do

  context 'Status counts' do
    before(:each) do
      order = FactoryGirl.create(:sub_order, status: Order::Status::CANCELLED)
      order1 = FactoryGirl.create(:sub_order, status: Order::Status::PAID)
      order2 = FactoryGirl.create(:sub_order, status: Order::Status::PAID)
    end

    it 'displays the counts for each order status type' do
      expect(SubOrder.status_counts[SubOrder::Status::CANCELLED]).to eq(1)
      expect(SubOrder.status_counts[SubOrder::Status::PAID]).to eq(2)
      expect(SubOrder.status_counts[SubOrder::Status::ORDERED]).to eq(0)
    end

    it 'displays the total count for all orders' do
      expect(SubOrder.all_count).to eq(3)
    end
  end
end
