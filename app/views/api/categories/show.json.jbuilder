json.extract! @category, :id, :title, :description
json.image_url asset_path(@category.image_url)
json.projects @category.projects do |project|
  json.extract! project, :id, :title, :description, :image_url, :user_id
end
