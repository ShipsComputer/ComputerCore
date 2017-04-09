class EnvironmentalReadingType < ApplicationRecord
  has_many :environmental_readings,  dependent: :destroy
end
