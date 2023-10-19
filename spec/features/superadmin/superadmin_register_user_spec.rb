require 'rails_helper'

feature 'Superadmin register user' do
  scenario 'successfully' do
    
    admin = Admin.create({
      email: FFaker::Internet.email, 
      password: Devise.friendly_token.first(8),
      
    })

		login_as admin
    visit tenants_path
    click_on 'Usuários'
    click_on 'Add New User'
    fill_in 'Full name', with: 'Homelab'
    fill_in 'Email Address', with: 'any@email.com'
    fill_in 'Password', with: 'anypassword'
    fill_in 'Confirm Password', with: 'anypassword'
    click_on 'Create'

    expect(page).to have_content('TestTenant')
  end


end