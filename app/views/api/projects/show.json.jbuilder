json.extract! @project, :id, :user_id, :category_id, :title, :description, :created_at, :updated_at, :end_date, :goal
json.category @project.category
json.main_photo_url @project.main_photo.url(:medium)
json.numPledges @project.pledges.count
json.amtPledged @project.pledges.sum(:amount)
json.time_remaining distance_of_time_in_words(Time.now, @project.end_date)
