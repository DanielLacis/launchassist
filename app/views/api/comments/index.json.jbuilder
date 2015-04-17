
json.array! @comments.each do |comment|
  json.extract! comment, :id, :project_id, :user_id, :body, :created_at, :updated_at
end
