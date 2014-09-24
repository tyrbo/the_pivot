require 'rails_helper'

RSpec.describe Category, :type => :model do
  it { should have_many(:categorizations) }
  it { should have_many(:items).through(:categorizations) }

  it { should validate_presence_of(:name) }

  it 'lists its categories' do
    category = FactoryGirl.create(:category)
    category.items << FactoryGirl.create(:item, title: 'Key Lime')
    category.items << FactoryGirl.create(:item, title: 'Apple')

    expect(category.item_titles).to eq('Key Lime, Apple')
  end

  it 'determines whether it has any active items' do
    category = FactoryGirl.create(:category)
    category.items << FactoryGirl.create(:item, title: 'Key Lime')

    assert category.has_active_items?
  end

  it 'determines whether it has any inactive items' do
    category = FactoryGirl.create(:category)
    item = FactoryGirl.create(:item, title: 'Key Lime', retire: true)
    category.items << item

    assert category.has_inactive_items?
  end
end
