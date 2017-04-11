class SensorReading < ApplicationRecord
  belongs_to :sensor_type
  belongs_to :sensor_array

  validates_numericality_of :reading, allow_nil: false
end
