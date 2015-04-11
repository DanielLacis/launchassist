json.extract! @tier, :id, :project_id, :amount, :delivery_date, :rewards, :created_at, :updated_at
json.numPledges @tier.pledges.count
