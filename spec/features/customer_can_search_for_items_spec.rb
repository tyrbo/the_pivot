require 'rails_helper'

describe 'A user searching for items', type: :feature do
  let!(:supplier) {FactoryGirl.create(:supplier)}
  let!(:item) {FactoryGirl.create(:item, supplier: supplier, title: "Bandaid", description: "fixes cuts")}
  let!(:item2) {FactoryGirl.create(:item, supplier: supplier, title: "Neosporin", description: "also fixes cuts")}
  let!(:item3) {FactoryGirl.create(:item, supplier: supplier, title: "Cake", description: "who eats cake during disasters?")}

  it 'should have a search link' do
    pending
    visit root_path

    expect(page).to have_button('Search', href: search_items_path)
  end

  it 'should find correct results after search for title' do
    visit root_path
    fill_in("search", with: "Bandaid")
    click_link_or_button("Search")


    expect(current_path).to eq(search_items_path)
    expect(page).to have_content(item.title)
    expect(page).to_not have_content(item3.title)
  end

  it 'should find correct results if keyword is within description' do
    visit root_path
    fill_in("search", with: "fixes")
    click_link_or_button("Search")

    expect(current_path).to eq(search_items_path)
    expect(page).to have_content(item.title)
    expect(page).to have_content(item2.title)

  end

end
