require 'rails_helper'

feature 'Superadmin list tenants' do
  scenario 'successfully' do
    
    admin = Admin.create({
      email: FFaker::Internet.email, 
      password: Devise.friendly_token.first(8),
      
    })
		tenant = Tenant.create(name: 'TesteTenant')

		login_as admin
    visit tenants_path

    expect(page).to have_css('td', text: 'TesteTenant')
  end


end