require 'rails_helper'

feature 'Superadmin list tenant_users' do
  scenario 'successfully' do
    
    admin = Admin.create({
      email: FFaker::Internet.email, 
      password: Devise.friendly_token.first(8),
      
    })
    role = UserRole.create(name: 'Admin', canCreateShop: true)
    user = User.create({
      email: FFaker::Internet.email, 
      password: Devise.friendly_token.first(8),
      user_role_id: role.id
    })

		login_as admin
    visit tenants_path
    click_on 'Usuários'

    #expect(page).to have_content(user.email)
    expect(page).to have_css('td', text: user.email)
  end


end