# == Schema Information
#
# Table name: categories
#
#  id          :integer          not null, primary key
#  title       :string           not null
#  description :text             not null
#  image_url   :string
#  created_at  :datetime
#  updated_at  :datetime
#

class Category < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true

  has_many :projects
end
