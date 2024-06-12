require 'rails_helper'

RSpec.feature 'User Authentication', type: :feature, js: true do
  let!(:user) { create(:user, email: 'test@test.com', password: 'password') }

  scenario 'User logs in and logs out' do
    puts "User created: #{user.inspect}"
    visit '/login'

    save_and_open_page # This will open the page in a browser for inspection

    fill_in 'Email:', with: 'test@test.com'
    fill_in 'Password:', with: 'password'

    click_button 'Login'

    expect(page).to have_current_path('/dashboard')
    expect(page).to have_content('Welcome, ' + user.username)

    click_button 'Logout'
    expect(page).to have_current_path('/login')
    expect(page).to have_content('Login')
  end
end
