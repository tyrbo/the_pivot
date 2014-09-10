require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe 'a supplier viewing the category page', type: :feature do
  let(:user) do
    User.create!(:full_name   => "john doe",
                :email        => "john_doe@example.com",
                :display_name => "john_doe_123",
                :role         => "supplier",
                :password     => 'password')
  end


  def login
    page.visit signin_path
    page.fill_in('session[email]',    with: user.email)
    page.fill_in('session[password]', with: 'password')
    page.click_button('Sign in')
  end

  it 'can create a category' do
    login
    page.click_link('Menu Category Managment')
    page.click_link('Create a New Category')
    expect(page).to have_field('category_name')
    fill_in('category[name]', with: 'Cats')
    page.click_on('Save Changes')
    expect(page.current_path).to eq('/supplier/categories/1')
    expect(page).to have_content('Cats')
  end

  it 'shows how many items are associated with a category' do
    login
    category = Category.create(name:'Cats')
    category.items.create(title:'items', description:'hihih')

    page.click_link('Menu Category Managment')
    within('.table') do
      expect(page).to have_content('1')
    end
  end

  it 'can view categories with items' do
    login
    category = Category.create(name:'Cats')
    category.items.create(title:'items', description:'hihih')

    page.click_link('Menu Category Managment')
    within('.table') do
      page.click_link('Cats')
    end
    expect(page.current_path).to eq('/categories/1')
    expect(page).to have_content('items')
    expect(page).to have_content('hihih')
  end

  def create_category
    login
    page.click_link('Menu Category Managment')
    page.click_link('Create a New Category')
    expect(page).to have_field('category_name')
    fill_in('category[name]', with: 'Cats')
    page.click_on('Save Changes')
    visit supplier_path
  end

  it 'can edit a category' do
    create_category
    page.click_link('Menu Category Managment')
    page.click_link('Edit')
    expect(page).to have_content('Editing: Cats')
    fill_in('category[name]',with: 'Dogs')
    page.click_on('Save Changes')
    expect(page.current_path).to eq('/supplier/categories/1')
    expect(page).to have_content('Dogs')
  end

  it 'can destroy a category' do
    create_category
    page.click_link('Menu Category Managment')
    page.click_link('Destroy')
    expect(page).to_not have_content('Cats')
  end

end
