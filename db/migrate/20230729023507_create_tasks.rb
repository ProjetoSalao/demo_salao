class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.decimal :value
      t.integer :duration

      t.timestamps
    end
  end
end
