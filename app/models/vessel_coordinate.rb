class VesselCoordinate < ApplicationRecord
  belongs_to :sensor_array
  belongs_to :vessel
end
