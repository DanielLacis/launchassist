json.array! @photos do |photo|
  json.extract! photo, :id, :project_id, :created_at, :updated_at
  json.photo_url photo.sub_photo.url(:medium)
  json.photo_url_large photo.sub_photo.url(:large)
end
