class AddColumnToProject < ActiveRecord::Migration
  def change
    change_table :projects do |t|
      t.attachment :main_photo
    end
  end
end
