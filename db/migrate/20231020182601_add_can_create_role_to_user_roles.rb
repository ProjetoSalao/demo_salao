class AddCanCreateRoleToUserRoles < ActiveRecord::Migration[7.0]
  def change
    add_column :user_roles, :canCreateRole, :boolean
  end
end
