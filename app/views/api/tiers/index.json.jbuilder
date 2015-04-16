@current_user_pledges = Project.find(params[:project_id]).pledges.where('user_id = ?', current_user.id)

json.array! @tiers.each do |tier|
  json.extract! tier, :id, :project_id, :delivery_date, :rewards, :amount, :created_at, :updated_at
  json.numPledges tier.pledges.count
  flag = true
  @current_user_pledges.each do |pledge|
    if pledge.tier_id == tier.id
      json.is_pledged pledge.id
      flag = false
      break
    end
  end
  if flag
    json.is_pledged 0;
  end
end
