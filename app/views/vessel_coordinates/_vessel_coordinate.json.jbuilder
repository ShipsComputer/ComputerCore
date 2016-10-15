json.extract! vessel_coordinate, :id, :sensor_array_id, :point, :point_accuracy, :heading, :speed, :altitude, :altitude_accuracy, :timestamp, :created_at, :updated_at
json.url vessel_coordinate_url(vessel_coordinate, format: :json)
