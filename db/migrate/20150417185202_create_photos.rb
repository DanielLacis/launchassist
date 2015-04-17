class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.attachment :sub_photo
      t.integer :project_id

      t.timestamps
    end
    add_index :photos, :project_id
  end
end
