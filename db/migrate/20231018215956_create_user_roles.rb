class CreateUserRoles < ActiveRecord::Migration[7.0]
  def change
    create_table :user_roles do |t|
      t.string :name
      t.belongs_to :tenant, null: false, foreign_key: true
      t.boolean :canCreateShop

      t.timestamps
    end
  end
end
