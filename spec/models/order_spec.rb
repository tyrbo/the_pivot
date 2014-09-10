require 'rails_helper'

RSpec.describe Order, :type => :model do
  let(:order) do
    Order.create(user_id: 1, order_total: 100.00, order_type: "pick-up", delivery_address: "1510 Blake Street, Denver, CO 80202", order_status: Order::Status::PAID)
  end

  it 'is valid' do
    expect(order).to be_valid
  end

  it 'is invalid without a user_id' do
    order.user_id = nil
    expect(order).not_to be_valid
  end

  it 'is invalid without an order total' do
    order.order_total = nil
    expect(order).not_to be_valid
  end

  it 'is invalid without an order type' do
    order.order_type = nil
    expect(order).not_to be_valid
  end

  it 'is invalid without an order status' do
    order.order_status = nil
    expect(order).to be_valid
  end

  it 'has items' do
    order.items.create(id: 140, title: 'Key Lime', description: 'Yum',  price_pie: 28.00)
    order.items.create(id: 125, title: 'Apple', description: 'Yum',  price_pie: 28.00)
    results = order.items
    expect(results.count).to eq(2)
  end

  it 'displays the counts for each order status type' do
    Order.create(order_status: Order::Status::PAID, user_id: 1, order_total: 23, order_type: "pick-up")
    Order.create(order_status: Order::Status::PAID, user_id: 2, order_total: 12, order_type: "pick-up")
    Order.create(order_status: Order::Status::CANCELLED, user_id: 3, order_total: 15, order_type: "pick-up")

    expect(Order.status_counts[Order::Status::CANCELLED]).to eq(1)
    expect(Order.status_counts[Order::Status::PAID]).to eq(2)
    expect(Order.status_counts[Order::Status::ORDERED]).to eq(0)
  end

  it 'displays the total count for all orders' do
    Order.create(order_status: Order::Status::PAID, user_id: 1, order_total: 23, order_type: "pick-up")
    Order.create(order_status: Order::Status::PAID, user_id: 2, order_total: 12, order_type: "pick-up")
    Order.create(order_status: Order::Status::CANCELLED, user_id: 3, order_total: 15, order_type: "pick-up")

    expect(Order.all_count).to eq(3)
  end

  it 'knows if its delivery' do
    order = Order.create(order_status: Order::Status::PAID, user_id: 1, order_total: 23, order_type: "delivery")
    expect(order.delivery?).to eq(true)
  end

  it 'knows if its cancelled' do
    order = Order.create(order_status: Order::Status::CANCELLED, user_id: 1, order_total: 23, order_type: "delivery")
    expect(order.cancelled?).to eq(true)
  end

  it 'knows if its ordered' do
    order = Order.create(order_status: Order::Status::ORDERED, user_id: 1, order_total: 23, order_type: "delivery")
    expect(order.ordered?).to eq(true)
  end

  it 'knows if its paid' do
    order = Order.create(order_status: Order::Status::PAID, user_id: 1, order_total: 23, order_type: "delivery")
    expect(order.paid?).to eq(true)
  end

  it 'knows if its complete' do
    order = Order.create(order_status: Order::Status::COMPLETED, user_id: 1, order_total: 23, order_type: "delivery")
    expect(order.complete?).to eq(true)
  end

  it 'has item quantity' do
    order.items.create(id: 140, title: 'Key Lime', description: 'Yum',  price_pie: 28.00)

    expect(order.item_quantity(140)).to eq(1)
  end

  it 'calculates a subtotal' do
    order.items.create(id: 140, title: 'Key Lime', description: 'Yum',  price_pie: 28.00)

    expect(order.subtotal(140)).to eq(28.0)
  end

end
