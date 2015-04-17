# == Schema Information
#
# Table name: categories
#
#  id              :integer          not null, primary key
#  title           :string           not null
#  description     :text             not null
#  created_at      :datetime
#  updated_at      :datetime
#  image_url_index :string
#  image_url_show  :string
#

class Category < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true

  has_many :projects
end
