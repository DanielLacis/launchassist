json.extract! @category, :id, :title, :description, :image_url
json.projects @category.projects do |project|
  json.extract! project, :id, :title, :description, :image_url, :user_id
end
