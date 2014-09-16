require 'rails_helper'

describe 'A user', type: :feature do
  let!(:supplier) { FactoryGirl.create(:supplier) }
  let!(:category) { FactoryGirl.create(:category) }
  let!(:item) { FactoryGirl.create(:item, supplier: supplier, categories: [category]) }

  it 'can view all the suppliers' do
    visit suppliers_path
    expect(page).to have_content supplier.name
  end

  it 'can view an individual supplier' do
    visit supplier_path(supplier)
    expect(page).to have_content supplier.name
    expect(page).to have_content item.title
    expect(page).to have_content item.description
  end
end
