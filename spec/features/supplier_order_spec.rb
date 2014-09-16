require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'
describe 'a supplier viewing the order page', type: :feature do
 let(:supplier) { FactoryGirl.create(:supplier, users: [user]) }
 let(:supplier2) { FactoryGirl.create(:supplier, name: 'Different', url: 'Different') }
 let(:user) { FactoryGirl.create(:user) }
 let(:order) { FactoryGirl.create(:order, user: user, items: [item, item2])}
 let(:item) { FactoryGirl.create(:item, supplier: supplier)}
 let(:item2) { FactoryGirl.create(:item, supplier: supplier2, title: 'Different')}

 before(:each) do
   login_as(username: user.email, password: user.password)
   order.create_sub_orders
 end

 it 'can see the sub-orders associated with them' do
   visit dashboard_supplier_sub_orders_path(supplier)
   click_on('Show')
   expect(page).to have_content(item.title)
   expect(page).to_not have_content(item2.title)
 end


end
