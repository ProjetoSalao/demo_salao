require 'rails_helper'

RSpec.describe "user_roles/show", type: :view do
  before(:each) do
    assign(:user_role, UserRole.create!(
      name: "Name",
      tenant: nil,
      canCreateShop: false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(//)
    expect(rendered).to match(/false/)
  end
end
