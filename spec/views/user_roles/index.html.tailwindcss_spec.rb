require 'rails_helper'

RSpec.describe "user_roles/index", type: :view do
  before(:each) do
    assign(:user_roles, [
      UserRole.create!(
        name: "Name",
        tenant: nil,
        canCreateShop: false
      ),
      UserRole.create!(
        name: "Name",
        tenant: nil,
        canCreateShop: false
      )
    ])
  end

  it "renders a list of user_roles" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
  end
end
