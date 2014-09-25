require 'rails_helper'

RSpec.describe Item, :type => :model do
  it { should have_many(:categorizations) }
  it { should have_many(:categories).through(:categorizations) }

  it { should have_many(:order_items) }
  it { should have_many(:orders).through(:order_items) }

  it { should have_many(:cart_items) }
  it { should have_many(:carts).through(:cart_items) }

  it { should belong_to(:supplier) }

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
  it { should ensure_length_of(:description) }
  xit { should validate_uniqueness_of(:title) }


  #it { should_have_attached_file(:picture) }

  it 'lists its categories' do
    item = FactoryGirl.create(:item)
    item.categories << FactoryGirl.create(:category, name: 'Savory')
    item.categories << FactoryGirl.create(:category, name: 'Gluten-free')

    expect(item.category_names).to eq('Savory, Gluten-free')
  end

  it 'returns active items' do
    item1 = FactoryGirl.create(:item, title: 'item1')
    item2 = FactoryGirl.create(:item, title: 'item2')
    item2.retire = true
    item2.save

    active = Item.active

    expect(active).to include(item1)
    expect(active).not_to include(item2)
  end

  it 'returns active items' do
    item1 = FactoryGirl.create(:item, title: 'item1')
    item2 = FactoryGirl.create(:item, title: 'item2')
    item2.retire = true
    item2.save

    inactive = Item.inactive

    expect(inactive).not_to include(item1)
    expect(inactive).to include(item2)
  end
end
