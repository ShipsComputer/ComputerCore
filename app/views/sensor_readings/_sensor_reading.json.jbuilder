json.extract! sensor, :id, :reading, :sensor_type_id, :sensor_array_id, :created_at, :updated_at
json.url sensor_url(sensor, format: :json)