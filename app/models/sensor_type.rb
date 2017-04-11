class SensorType < ApplicationRecord
  has_many :sensor_readings,  dependent: :destroy
end
