class Coordinate < ApplicationRecord
  attr_accessor :longitude, :latitude

  belongs_to :sensor_array
  before_save :round_coordinate_metrics
  before_save :create_point

  validates :sensor_array_id, presence: true
  validates :latitude, numericality: { greater_than_or_equal_to:  -90, less_than_or_equal_to:  90 }
  validates :longitude, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }
  validates :heading, numericality: { less_than: 360, greater_than_or_equal_to: 0 }, allow_blank: true
  validates_numericality_of :point_accuracy, allow_nil: true
  validates_numericality_of :altitude, allow_nil: true
  validates_numericality_of :altitude_accuracy, allow_nil: true
  validates_numericality_of :heading, allow_nil: true
  validates_numericality_of :speed, allow_nil: true
  validates_datetime :timestamp

  def round_coordinate_metrics
    self.latitude = latitude.to_f.round(6)
    self.longitude = longitude.to_f.round(6)
    self.point_accuracy = point_accuracy.nil? ? nil : point_accuracy.round(1)
    self.altitude = altitude.nil? ? nil : altitude.round(1)
    self.altitude_accuracy = altitude_accuracy.nil? ? nil : altitude_accuracy.round(1)
    self.heading = heading.nil? ? nil : heading.round(0)
    self.speed = speed.nil? ? nil : speed.round(2)
  end

  def create_point
    self.point = RGeo::Geographic.spherical_factory(srid: 4326).point(longitude ,latitude)
  end

  def lat
    self.point.latitude if self.point
  end

  def lon
    self.point.longitude if self.point
  end

  def vessel
    self.sensor_array.vessel
  end
end
