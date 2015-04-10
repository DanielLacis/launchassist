class CreatePledges < ActiveRecord::Migration
  def change
    create_table :pledges do |t|
      t.integer :tier_id
      t.integer :user_id
    end

    add_index :pledges, [:tier_id, :user_id], unique: true
    add_index :pledges, :user_id
    add_index :pledges, :tier_id
  end
end
