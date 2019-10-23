json.extract! backend_group, :id, :name, :description, :is_active, :is_public, :created_at, :updated_at
json.url backend_group_url(backend_group, format: :json)
