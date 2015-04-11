json.extract! @project, :id, :category_id, :title, :image_url, :description, :created_at, :updated_at, :end_date, :goal
json.numPledges @project.pledges.count
json.amtPledged @project.pledges.sum(:amount)
json.time_remaining distance_of_time_in_words(Time.now, @project.end_date)
