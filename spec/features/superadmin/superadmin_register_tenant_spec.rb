require 'rails_helper'

feature 'Superadmin register tenant' do
  scenario 'successfully' do
    
    user = Admin.create({
      email: FFaker::Internet.email, 
      password: Devise.friendly_token.first(8),
      
    })

		login_as user
    visit new_tenant_path
    fill_in 'Name', with: 'Homelab'
    fill_in 'Subdomain', with: 'labs'
    click_on 'Create Tenant'

    expect(page).to have_css('h1', text: 'Homelab')
  end


end