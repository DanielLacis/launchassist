# == Schema Information
#
# Table name: photos
#
#  id                     :integer          not null, primary key
#  sub_photo_file_name    :string
#  sub_photo_content_type :string
#  sub_photo_file_size    :integer
#  sub_photo_updated_at   :datetime
#  project_id             :integer
#  created_at             :datetime
#  updated_at             :datetime
#

class Photo < ActiveRecord::Base
  belongs_to :project

  has_attached_file :sub_photo, styles: {
    large: "x600>",
    medium: "x300>",
    small: "50x50#"
  }

  validates_attachment_content_type(
    :sub_photo,
    content_type: /\Aimage\/.*\Z/
  )
end
