require 'test_helper'

class Api::V1::CoordinatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @coordinate = coordinates(:one)
    @sensor_array = sensor_arrays(:aft)
  end

  test "should create new coordinate" do
    assert_difference('Coordinate.count', 1) do
      response = post '/api/v1/coordinates', params: { :latitude => 45.4215, :longitude => -75.6972, :timestamp => Time.zone.parse('2016-01-01 00:00:00'), :format => :json, sensor_array_handle: @sensor_array.handle }
    end
    body = JSON.parse(response.body)
    assert_response 201

    assert_equal 45.4215, body['latitude']
    assert_equal -75.6972, body['longitude']
    assert_equal '2016-01-01T00:00:00.000Z', body['timestamp']
  end

  test "should fail with useful response because lat and long are out of bounds" do
    assert_no_difference('Coordinate.count') do
      response = post '/api/v1/coordinates', params: { :latitude => 90.1, :longitude => -420.0, :timestamp => Time.zone.parse('2016-01-01 00:00:00'), :format => :json, sensor_array_handle: @sensor_array.handle }
    end
    body = JSON.parse(response.body)
    assert_response 422

    assert_equal ["must be less than or equal to 90"], body['latitude']
    assert_equal ["must be greater than or equal to -180"], body['longitude']
  end

  test "should fail with useful response because no handle is supplied" do
    assert_no_difference('Coordinate.count') do
      response = post '/api/v1/coordinates', params: { :latitude => 90.1, :longitude => -420.0, :timestamp => Time.zone.parse('2016-01-01 00:00:00'), :format => :json }
    end
    body = JSON.parse(response.body)
    assert_response 422

    assert_equal ["missing sensor array handle"], body['sensor_array_handle']
  end

  test "should fail with useful response because handle incorrect" do
    assert_no_difference('Coordinate.count') do
      response = post '/api/v1/coordinates', params: { :latitude => 90.1, :longitude => -420.0, :timestamp => Time.zone.parse('2016-01-01 00:00:00'), :format => :json, sensor_array_handle: 'foo' }
    end
    body = JSON.parse(response.body)
    assert_response 422

    assert_equal ["there is no sensor array handle 'foo'"], body['sensor_array_handle']
  end
end
