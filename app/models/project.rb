# == Schema Information
#
# Table name: projects
#
#  id                      :integer          not null, primary key
#  title                   :string           not null
#  description             :text             not null
#  end_date                :datetime         not null
#  goal                    :integer          not null
#  user_id                 :integer          not null
#  category_id             :integer          not null
#  created_at              :datetime
#  updated_at              :datetime
#  main_photo_file_name    :string
#  main_photo_content_type :string
#  main_photo_file_size    :integer
#  main_photo_updated_at   :datetime
#

class Project < ActiveRecord::Base
  # attr_accessor :main_photo_file_name, :main_photo_content_type, :main_photo_file_size, :main_photo_updated_at
  validates :title, :description, :user_id, :category_id, presence: true
  validates :title, uniqueness: {scope: :category_id}
  belongs_to :user
  belongs_to :category
  has_many :tiers, dependent: :destroy
  has_many :pledges, through: :tiers, source: :pledges
  has_many :backers, through: :pledges, source: :user
  has_many :comments
  has_many :photos

  has_attached_file :main_photo, styles: {
    large: "x600>",
    medium: "x300>",
    small: "50x50#"
  }

  validates_attachment_content_type(
    :main_photo,
    content_type: /\Aimage\/.*\Z/
  )
end
