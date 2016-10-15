require 'test_helper'

class VesselCoordinatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vessel_coordinate = vessel_coordinates(:one)
    @sensor_array = sensor_arrays(:aft)
  end

  test "should get index" do
    get vessel_coordinates_url
    assert_response :success
  end

  test "should get new" do
    get new_vessel_coordinate_url
    assert_response :success
  end

  test "should create vessel_coordinate" do
    assert_difference('VesselCoordinate.count') do
      post vessel_coordinates_url, params: { vessel_coordinate: { altitude: @vessel_coordinate.altitude, altitude_accuracy: @vessel_coordinate.altitude_accuracy, heading: @vessel_coordinate.heading, latitude: @vessel_coordinate.lat, longitude: @vessel_coordinate.lon, point_accuracy: @vessel_coordinate.point_accuracy, sensor_array_id: @vessel_coordinate.sensor_array_id, speed: @vessel_coordinate.speed, timestamp: @vessel_coordinate.timestamp } }
    end

    assert_redirected_to vessel_coordinate_url(VesselCoordinate.last)
  end

  test "should show vessel_coordinate" do
    get vessel_coordinate_url(@vessel_coordinate)
    assert_response :success
  end

  test "should get edit" do
    get edit_vessel_coordinate_url(@vessel_coordinate)
    assert_response :success
  end

  test "should update vessel_coordinate" do
    patch vessel_coordinate_url(@vessel_coordinate), params: { vessel_coordinate: { altitude: @vessel_coordinate.altitude, altitude_accuracy: @vessel_coordinate.altitude_accuracy, heading: @vessel_coordinate.heading, latitude: @vessel_coordinate.lat, longitude: @vessel_coordinate.lon, point_accuracy: @vessel_coordinate.point_accuracy, sensor_array_id: @vessel_coordinate.sensor_array_id, speed: @vessel_coordinate.speed, timestamp: @vessel_coordinate.timestamp } }
    assert_redirected_to vessel_coordinate_url(@vessel_coordinate)
  end

  test "should destroy vessel_coordinate" do
    vessel_coordinate = @sensor_array.vessel_coordinates.create!(latitude: 42, longitude: 42, timestamp: DateTime.now)

    assert_difference('VesselCoordinate.count', -1) do
      delete vessel_coordinate_url(vessel_coordinate)
    end

    assert_redirected_to vessel_coordinates_url
  end
end
