class AddTenantToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :tenant, optional: true, foreign_key: true
  end
end
