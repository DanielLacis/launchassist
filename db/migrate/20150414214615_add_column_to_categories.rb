class AddColumnToCategories < ActiveRecord::Migration
  def change
    remove_column :categories, :image_url
    add_column :categories, :image_url_index, :string
    add_column :categories, :image_url_show, :string
  end
end
