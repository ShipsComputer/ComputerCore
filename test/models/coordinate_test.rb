require 'test_helper'

class CoordinateTest < ActiveSupport::TestCase
  setup do
    @craft = crafts(:test_ship)
    @sensor_array = sensor_arrays(:navigation)
  end

  test "Latitude and longitude are converted to a GIS point" do
    coordinate = @sensor_array.coordinates.create(latitude: 42, longitude: 24, timestamp: DateTime.now)

    assert_equal coordinate.point.class, RGeo::Geographic::SphericalPointImpl
    assert_equal coordinate.lat, 42.0
    assert_equal coordinate.lon, 24.0
  end
end
