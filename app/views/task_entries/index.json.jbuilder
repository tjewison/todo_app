json.array!(@task_entries) do |task_entry|
  json.extract! task_entry, :id, :description
  json.url task_entry_url(task_entry, format: :json)
end
