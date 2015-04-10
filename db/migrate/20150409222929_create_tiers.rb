class CreateTiers < ActiveRecord::Migration
  def change
    create_table :tiers do |t|
      t.integer :project_id, null: false
      t.text :rewards, null: false
      t.datetime :end_date, null: false
      t.integer :amount, null: false

      t.timestamps
    end
    add_index :tiers, :project_id
  end
end
