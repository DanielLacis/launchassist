class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.string :image_url
      t.datetime :end_date, null: false
      t.integer :goal, limit: 5, null: false
      t.integer :user_id, null: false
      t.integer :category_id, null: false

      t.timestamps
    end

    add_index :projects, :user_id
    add_index :projects, :category_id
    add_index :projects, [:category_id, :title], unique: true
  end
end
