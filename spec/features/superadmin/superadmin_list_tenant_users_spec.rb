require 'rails_helper'

feature 'Superadmin list tenant_users' do
  scenario 'successfully' do
    
    admin = Admin.create({
      email: FFaker::Internet.email, 
      password: Devise.friendly_token.first(8),
      
    })
		tenant = Tenant.create(name: 'TesteTenant')
    user = User.create({
      email: FFaker::Internet.email, 
      password: Devise.friendly_token.first(8),
      tenant_id: tenant.id
    })

		login_as admin
    visit tenants_path
    click_on 'Usuários'

    expect(page).to have_css('td', text: user.email)
  end


end