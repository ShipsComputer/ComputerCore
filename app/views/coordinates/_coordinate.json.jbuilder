json.extract! coordinate, :id, :sensor_array_id, :point, :point_accuracy, :heading, :speed, :altitude, :altitude_accuracy, :timestamp, :created_at, :updated_at
json.url coordinate_url(coordinate, format: :json)
