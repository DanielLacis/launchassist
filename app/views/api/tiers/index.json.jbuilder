json.array! @tiers.each do |tier|
  json.extract! tier, :id, :project_id, :delivery_date, :rewards, :amount, :created_at, :updated_at
  json.numPledges tier.pledges.count
end
