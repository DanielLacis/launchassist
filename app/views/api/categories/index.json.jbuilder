json.array! @categories.each do |category|
  json.extract! category, :id, :title, :description, :image_url_index, :image_url_show
end
