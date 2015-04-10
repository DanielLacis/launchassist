# == Schema Information
#
# Table name: pledges
#
#  id      :integer          not null, primary key
#  tier_id :integer
#  user_id :integer
#

class Pledge < ActiveRecord::Base
  validates :user_id, presence: true
  validates :tier_id, presence: true
  validate :one_pledge_per_user_per_project
  belongs_to :tier
  belongs_to :user
  has_one :project, through: :tier, source: :project

  private

  def one_pledge_per_user_per_project
    # SELECT
    #   pledges.*
    # FROM
    #   pledges
    # JOIN
    #   tiers
    # JOIN
    #   projects
    # WHERE
    #   pledges.user_id = #{user_id} AND
    #   project.id = #{self.project.id}
    ### write above SQL query in active record
    true
  end
end
