require 'spec_helper'

RSpec.describe 'Books Views', type: :feature do
  before(:each) do
    u1 = User.new({ email: 'test1@s.com', name: 'Test1', password: '123456', password_confirmation: '123456' })
    u1.save
    visit '/users/sign_in'
    fill_in 'Email', with: 'test1@s.com'
    fill_in 'Password', with: '123456'
    click_button('Log in')
    expect(page).to have_content('Signed in successfully.')
  end

  it 'Add new book' do
   find(:xpath, "//a[@href='/books/new']").click
   expect(page).to have_content('Add New Book')
   fill_in 'Title', with: 'test title'
   fill_in 'Author', with: 'test author'
   fill_in 'Benefits I got', with: 'test description'
   click_button('Create Book')
   expect(page).to have_content('Library')
 end
end
