class SensorArray < ApplicationRecord
  belongs_to :craft
  validates :craft_id, presence: true
  validates :handle, uniqueness: true
  has_many :coordinates,  dependent: :destroy
  has_many :sensor_readings,  dependent: :destroy
end
