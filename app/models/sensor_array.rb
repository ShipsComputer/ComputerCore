class SensorArray < ApplicationRecord
  belongs_to :vessel
  validates :vessel_id, presence: true
  has_many :coordinates
end
