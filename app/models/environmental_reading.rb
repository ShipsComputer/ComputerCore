class EnvironmentalReading < ApplicationRecord
  belongs_to :environmental_reading_type
  belongs_to :sensor_array

  validates_numericality_of :reading, allow_nil: false
end
