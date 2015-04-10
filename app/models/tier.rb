# == Schema Information
#
# Table name: tiers
#
#  id         :integer          not null, primary key
#  project_id :integer          not null
#  rewards    :text             not null
#  end_date   :datetime         not null
#  amount     :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class Tier < ActiveRecord::Base
  validates :project_id, :rewards, :end_date, :amount, presence: true
  validates :amount, uniqueness: {scope: :project_id}

  has_many :pledges
  belongs_to :project
  has_many :users, through: :pledges, source: :user
  has_one :category, through: :project, source: :category

end
