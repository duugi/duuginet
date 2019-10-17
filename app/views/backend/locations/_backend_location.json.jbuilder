json.extract! backend_location, :id, :name, :country_code, :description, :state_code, :timezone_code, :is_active, :created_at, :updated_at
json.url backend_location_url(backend_location, format: :json)
