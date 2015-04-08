json.array! @categories.each do |category|
  json.extract! category, :id, :title, :description
  json.image_url asset_path(category.image_url)
end
