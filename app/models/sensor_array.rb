class SensorArray < ApplicationRecord
  belongs_to :craft
  validates :craft_id, presence: true
  has_many :coordinates
  has_many :weather_readings
end
