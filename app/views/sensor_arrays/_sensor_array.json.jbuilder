json.extract! sensor_array, :id, :name, :vessel_id, :location, :created_at, :updated_at
json.url sensor_array_url(sensor_array, format: :json)