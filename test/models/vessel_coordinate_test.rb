require 'test_helper'

class VesselCoordinateTest < ActiveSupport::TestCase
  setup do
    @vessel = vessels(:test_ship)
    @sensor_array = sensor_arrays(:navigation)
  end

  test "Latitude and longitude are converted to a GIS point" do
    vessel_coordinate = @sensor_array.vessel_coordinates.create(latitude: 42, longitude: 24, timestamp: DateTime.now)

    assert_equal vessel_coordinate.point.class, RGeo::Geographic::SphericalPointImpl
    assert_equal vessel_coordinate.lat, 42.0
    assert_equal vessel_coordinate.lon, 24.0
  end
end
