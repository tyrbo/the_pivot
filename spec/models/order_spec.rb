require 'rails_helper'

RSpec.describe Order, :type => :model do
  it { should have_many(:order_items) }
  it { should have_many(:items).through(:order_items) }
  it { should belong_to(:user) }

  context 'as delivery' do
    before { subject.stub(:delivery?) { true } }
    it { should validate_presence_of(:delivery_address) }
  end

  context 'not delivery' do
    before { subject.stub(:delivery?) { false } }
    it { should_not validate_presence_of(:delivery_address) }
  end

  it { should validate_presence_of(:order_total) }
  it { should validate_presence_of(:order_type) }

  xcontext 'Status counts' do
    before(:each) do
      FactoryGirl.create(:order, order_status: Order::Status::CANCELLED)
      FactoryGirl.create(:order, order_status: Order::Status::PAID)
      FactoryGirl.create(:order, order_status: Order::Status::PAID)
    end
    it 'displays the counts for each order status type' do
      expect(Order.status_counts[Order::Status::CANCELLED]).to eq(1)
      expect(Order.status_counts[Order::Status::PAID]).to eq(2)
      expect(Order.status_counts[Order::Status::ORDERED]).to eq(0)
    end

    it 'displays the total count for all orders' do
      expect(Order.all_count).to eq(3)
    end
  end

  it 'knows if its delivery' do
    order = FactoryGirl.create(:order, order_type: 'delivery', delivery_address: 'test')
    expect(order.delivery?).to eq(true)
  end

  it 'knows if its cancelled' do
    order = FactoryGirl.create(:order, order_status: Order::Status::CANCELLED)
    expect(order.cancelled?).to eq(true)
  end

  it 'knows if its ordered' do
    order = FactoryGirl.create(:order, order_status: Order::Status::ORDERED)
    expect(order.ordered?).to eq(true)
  end

  it 'knows if its paid' do
    order = FactoryGirl.create(:order, order_status: Order::Status::PAID)
    expect(order.paid?).to eq(true)
  end

  it 'knows if its complete' do
    order = FactoryGirl.create(:order, order_status: Order::Status::COMPLETED)
    expect(order.complete?).to eq(true)
  end

  it 'has item quantity' do
    order = FactoryGirl.create(:order)
    item = FactoryGirl.create(:item)
    order.items << item

    expect(order.item_quantity(item.id)).to eq(1)
  end

  it 'calculates a subtotal' do
    order = FactoryGirl.create(:order)
    item = FactoryGirl.create(:item, price: 28.00)
    order.items << item

    expect(order.subtotal(item.id)).to eq(28.0)
  end

  it 'creates sub orders from an order' do
    order = FactoryGirl.create(:order, user: FactoryGirl.create(:user))
    item = FactoryGirl.create(:item, price: 28.00)
    order.items << item
    order.create_sub_orders

    expect(SubOrder.all.count).to eq(1)
  end

end
