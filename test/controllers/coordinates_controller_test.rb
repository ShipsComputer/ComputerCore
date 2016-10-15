require 'test_helper'

class CoordinatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @coordinate = coordinates(:one)
    @sensor_array = sensor_arrays(:aft)
  end

  test "should get index" do
    get coordinates_url
    assert_response :success
  end

  test "should get new" do
    get new_coordinate_url
    assert_response :success
  end

  test "should create coordinate" do
    assert_difference('Coordinate.count') do
      post coordinates_url, params: { coordinate: { altitude: @coordinate.altitude, altitude_accuracy: @coordinate.altitude_accuracy, heading: @coordinate.heading, latitude: @coordinate.lat, longitude: @coordinate.lon, point_accuracy: @coordinate.point_accuracy, sensor_array_id: @coordinate.sensor_array_id, speed: @coordinate.speed, timestamp: @coordinate.timestamp } }
    end

    assert_redirected_to coordinate_url(Coordinate.last)
  end

  test "should show coordinate" do
    get coordinate_url(@coordinate)
    assert_response :success
  end

  test "should get edit" do
    get edit_coordinate_url(@coordinate)
    assert_response :success
  end

  test "should update coordinate" do
    patch coordinate_url(@coordinate), params: { coordinate: { altitude: @coordinate.altitude, altitude_accuracy: @coordinate.altitude_accuracy, heading: @coordinate.heading, latitude: @coordinate.lat, longitude: @coordinate.lon, point_accuracy: @coordinate.point_accuracy, sensor_array_id: @coordinate.sensor_array_id, speed: @coordinate.speed, timestamp: @coordinate.timestamp } }
    assert_redirected_to coordinate_url(@coordinate)
  end

  test "should destroy coordinate" do
    coordinate = @sensor_array.coordinates.create!(latitude: 42, longitude: 42, timestamp: DateTime.now)

    assert_difference('Coordinate.count', -1) do
      delete coordinate_url(coordinate)
    end

    assert_redirected_to coordinates_url
  end
end
