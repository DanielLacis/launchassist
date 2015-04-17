class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :body, null: false
      t.integer :user_id
      t.integer :project_id

      t.timestamps
    end
    add_index :comments, :user_id
    add_index :comments, :project_id
  end
end
