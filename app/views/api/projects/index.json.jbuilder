json.array! @projects.each do |project|
  json.extract! project, :id, :category_id, :title, :description, :image_url, :created_at, :updated_at, :end_date
end
