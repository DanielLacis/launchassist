@current_user_pledges = Project.find(params[:project_id]).pledges.where('user_id = ?', current_user.id)

json.array! @tiers.each do |tier|
  json.extract! tier, :id, :project_id, :delivery_date, :rewards, :amount, :created_at, :updated_at
  json.numPledges tier.pledges.count
  if @current_user_pledges.any? { |pledge| pledge.tier_id == tier.id }
    json.is_pledged true
  else
    json.is_pledged false
  end
end
