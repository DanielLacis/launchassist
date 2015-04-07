# == Schema Information
#
# Table name: projects
#
#  id          :integer          not null, primary key
#  title       :string           not null
#  description :text             not null
#  image_url   :string
#  user_id     :integer          not null
#  category_id :integer          not null
#  created_at  :datetime
#  updated_at  :datetime
#

class Project < ActiveRecord::Base
  validates :title, :description, :user_id, :category_id, presence: true
  belongs_to :user
  belongs_to :category
end
