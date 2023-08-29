require 'rails_helper'

feature 'Superadmin register tenant' do
  scenario 'successfully' do
    tenant = Tenant.create(id: 99, name: 'Reinaldo', subdomain: 'reinaldo')

    user = User.create({
      email: FFaker::Internet.email, 
      password: Devise.friendly_token.first(8),
      tenant: tenant 
    })

		login_as user
    visit new_tenant_path
    fill_in 'Name', with: 'Homelab'
    fill_in 'Subdomain', with: 'labs'
    click_on 'Create Tenant'

    expect(page).to have_css('h1', text: 'Homelab')
  end


end