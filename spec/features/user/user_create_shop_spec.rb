require 'rails_helper'

feature 'User create shop' do
  scenario 'successfully' do

    role = UserRole.create(name: 'Admin', canCreateShop: true)
    user = User.create({
      email: FFaker::Internet.email, 
      password: Devise.friendly_token.first(8),
      user_role_id: role.id
    })
		
		login_as user, scope: :user
    visit new_shop_path
    fill_in 'Name', with: 'NewShop'
    click_on 'Create'

    expect(page).to have_content('NewShop')
  end

	scenario 'without permission' do
    role = UserRole.create(name: 'Admin', canCreateShop: false)
    user = User.create({
      email: FFaker::Internet.email, 
      password: Devise.friendly_token.first(8),
      user_role_id: role.id
    })
		
		login_as user, scope: :user
    visit new_shop_path
    fill_in 'Name', with: 'NewShop'
    click_on 'Create'

    expect(page).to have_content('Not authorized')

	end



end