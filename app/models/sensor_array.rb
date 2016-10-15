class SensorArray < ApplicationRecord
  belongs_to :vessel
  validates :vessel_id, presence: true
  has_many :vessel_coordinates
end
