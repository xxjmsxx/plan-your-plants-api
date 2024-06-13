require 'rails_helper'

RSpec.feature 'User Authentication', type: :feature, js: true do
  puts User.count
  let!(:user) { create(:user) }
  puts User.count


  scenario 'User logs in and logs out' do

    visit '/login'

    fill_in 'Email', with: 'santi@gmail.com'
    fill_in 'Password', with: '123456'
    click_button 'Login'


    expect(page).to have_current_path('/dashboard')
    expect(page).to have_content('Welcome, ' + user.username)

    click_button 'Logout'
    expect(page).to have_current_path('/login')
    expect(page).to have_content('Login')
  end
end
