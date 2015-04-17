json.extract! @comment, :id, :project_id, :body, :created_at, :updated_at
json.user @comment.user, :username, :id
