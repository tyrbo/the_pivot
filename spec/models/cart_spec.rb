require 'rails_helper'

RSpec.describe Cart, :type => :model do

  let(:order) { FactoryGirl.create(:order) }
  let(:item) { FactoryGirl.create(:item) }

  it { should have_many(:cart_items) }
  it { should have_many(:items).through(:cart_items) }

  it 'creates order items for an order' do
    cart = Cart.new
    cart.items << item
    cart.create_order_items(order)
    expect(order.order_items.count).to eq(1)
  end

end
