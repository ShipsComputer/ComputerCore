require 'test_helper'

class SensorArraysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sensor_array = sensor_arrays(:one)
  end

  test "should get index" do
    get sensor_arrays_url
    assert_response :success
  end

  test "should get new" do
    get new_sensor_array_url
    assert_response :success
  end

  test "should create sensor_array" do
    assert_difference('SensorArray.count') do
      post sensor_arrays_url, params: { sensor_array: { location: @sensor_array.location, name: @sensor_array.name, vessel_id: @sensor_array.vessel_id } }
    end

    assert_redirected_to sensor_array_url(SensorArray.last)
  end

  test "should show sensor_array" do
    get sensor_array_url(@sensor_array)
    assert_response :success
  end

  test "should get edit" do
    get edit_sensor_array_url(@sensor_array)
    assert_response :success
  end

  test "should update sensor_array" do
    patch sensor_array_url(@sensor_array), params: { sensor_array: { location: @sensor_array.location, name: @sensor_array.name, vessel_id: @sensor_array.vessel_id } }
    assert_redirected_to sensor_array_url(@sensor_array)
  end

  test "should destroy sensor_array" do
    assert_difference('SensorArray.count', -1) do
      delete sensor_array_url(@sensor_array)
    end

    assert_redirected_to sensor_arrays_url
  end
end
