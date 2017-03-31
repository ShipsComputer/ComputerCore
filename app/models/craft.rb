class Craft < ApplicationRecord
  has_many :sensor_arrays
  validates :handle, uniqueness: true
end
