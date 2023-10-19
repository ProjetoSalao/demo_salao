require 'rails_helper'

feature 'User register user role' do
  scenario 'successfully' do

    role = UserRole.create(name: 'Admin', canCreateShop: true)
    user = User.create({
      email: FFaker::Internet.email, 
      password: Devise.friendly_token.first(8),
      user_role_id: role.id
    })
		
		login_as user
    visit new_user_role_path
    fill_in 'Name', with: 'AdminRole'
    check 'user_role_canCreateShop'
    click_on 'Create User role'

    expect(page).to have_content('AdminRole')
  end


end