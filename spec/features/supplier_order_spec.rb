#require 'rails_helper'
#require 'capybara/rails'
#require 'capybara/rspec'
#
#describe 'a supplier viewing the order page', type: :feature do
#  let(:user) do
#    User.create!(:full_name   => "john doe",
#                :email        => "john_doe@example.com",
#                :display_name => "john_doe_123",
#                :role         => "supplier",
#                :password     => 'password')
#  end
#
#  def login
#    page.visit signin_path
#    page.fill_in('session[email]',    with: user.email)
#    page.fill_in('session[password]', with: 'password')
#    page.click_button('Sign in')
#  end
#
#  it 'has an order management on page' do
#    login
#    page.click_link('Order Management')
#    expect(page).to have_content('Order Status Counts')
#  end
#
#  it 'has order information on the page' do
#    order = Order.create!(user_id: user.id, order_total: '1000', order_type: 'pick-up', order_status:'ordered')
#    login
#
#    page.click_link('Order Management')
#    within(page.all('.table')[0]) do
#      expect(page).to have_content('See Ordered/Pending Orders(1)')
#    end
#    within(page.all('.table')[1]) do
#      expect(page).to have_content('1')
#      expect(page).to have_content('1000')
#      expect(page).to have_content('PICK-UP')
#      expect(page).to have_content('ORDERED')
#    end
#  end
#
#  it 'can view orders' do
#    order = Order.create!(user_id: user.id, order_total: '1000', order_type: 'pick-up', order_status:'ordered')
#    login
#
#    page.click_link('Order Management')
#    page.click_link('1')
#    expect(page.current_path).to eq('/supplier/orders/1')
#    expect(page).to have_content('john doe')
#    expect(page).to have_content('1000')
#  end
#
#  it 'has counts orders by status' do
#    order1 = Order.create!(user_id: 1, order_total: '1000', order_type: 'pick-up', order_status:'ordered')
#    order2 = Order.create!(user_id: 2, order_total: '1000', order_type: 'pick-up', order_status:'completed')
#    order3 = Order.create!(user_id: 3, order_total: '1000', order_type: 'pick-up', order_status:'cancelled')
#    order4 = Order.create!(user_id: 4, order_total: '1000', order_type: 'pick-up', order_status:'paid')
#    login
#
#    page.click_link('Order Management')
#    within(page.all('.table')[0]) do
#      expect(page).to have_content('See Ordered/Pending Orders(1)')
#      expect(page).to have_content('See Cancelled Orders(1)')
#      expect(page).to have_content('See Completed Orders(1)')
#      expect(page).to have_content('See Paid Orders(1)')
#    end
#  end
#
#  it 'sorts orders by status' do
#    order1 = Order.create!(user_id: 1, order_total: '1000', order_type: 'pick-up', order_status:'ordered')
#    order2 = Order.create!(user_id: 2, order_total: '2000', order_type: 'pick-up', order_status:'completed')
#
#    login
#
#    page.click_link('Order Management')
#    page.click_link('See Ordered/Pending Orders')
#    expect(page).to have_content('1000')
#    expect(page).to_not have_content('2000')
#  end
#
#  it 'can delete orders' do
#    order = Order.create!(user_id: user.id, order_total: '1000', order_type: 'pick-up', order_status:'ordered')
#    login
#
#    page.click_link('Order Management')
#    page.click_link('Delete')
#    expect(page).to_not have_content('1000')
#  end
#
#  it 'can cancel an order' do
#    order = Order.create!(user_id: user.id, order_total: '1000', order_type: 'pick-up', order_status:'ordered')
#    login
#
#    page.click_link('Order Management')
#    page.click_link('1')
#    page.click_link('Cancel Order')
#    expect(page).to have_content('CANCELLED')
#  end
#
#  it 'can change order status' do
#    order = Order.create!(user_id: user.id, order_total: '1000', order_type: 'pick-up', order_status:'ordered')
#    login
#
#    page.click_link('Order Management')
#    page.click_link('1')
#    page.click_link('Mark As Paid')
#    expect(page).to have_content('PAID')
#  end
#end
