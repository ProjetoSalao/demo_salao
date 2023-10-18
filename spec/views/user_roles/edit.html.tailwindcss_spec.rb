require 'rails_helper'

RSpec.describe "user_roles/edit", type: :view do
  let(:user_role) {
    UserRole.create!(
      name: "MyString",
      tenant: nil,
      canCreateShop: false
    )
  }

  before(:each) do
    assign(:user_role, user_role)
  end

  it "renders the edit user_role form" do
    render

    assert_select "form[action=?][method=?]", user_role_path(user_role), "post" do

      assert_select "input[name=?]", "user_role[name]"

      assert_select "input[name=?]", "user_role[tenant_id]"

      assert_select "input[name=?]", "user_role[canCreateShop]"
    end
  end
end
