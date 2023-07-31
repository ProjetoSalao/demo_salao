json.extract! task, :id, :name, :value, :duration, :created_at, :updated_at
json.url task_url(task, format: :json)
