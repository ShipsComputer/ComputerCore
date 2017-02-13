json.extract! weather_reading, :id, :temp, :humidity, :pressure, :sensor_array_id, :created_at, :updated_at
json.url weather_reading_url(weather_reading, format: :json)