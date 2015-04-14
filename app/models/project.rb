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
  validates :title, uniqueness: {scope: :category_id}
  belongs_to :user
  belongs_to :category
  has_many :tiers
  has_many :pledges, through: :tiers, source: :pledges
  has_many :backers, through: :pledges, source: :user
  has_attached_file :main_photo, styles: {
    big: "600x600>",
    small: "50x50#"
  }
  validates_attachment_content_type(
    :main_photo,
    content_type: /\Aimage\/.*\Z/
  )
end
