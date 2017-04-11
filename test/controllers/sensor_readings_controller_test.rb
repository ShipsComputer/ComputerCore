require 'test_helper'

class SensorReadingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sensor_reading = sensor_readings(:one)
  end

  test "should get index" do
    get sensor_readings_url
    assert_response :success
  end

  test "should get new" do
    get new_sensor_reading_url
    assert_response :success
  end

  test "should create sensor reading" do
    assert_difference('SensorReading.count') do
      post sensor_readings_url, params: { sensor_reading: { sensor_type_id: @sensor_reading.sensor_type_id, reading: @sensor_reading.reading, sensor_array_id: @sensor_reading.sensor_array_id } }
    end

    assert_redirected_to sensor_reading_url(SensorReading.last)
  end

  test "should show sensor reading" do
    get sensor_reading_url(@sensor_reading)
    assert_response :success
  end

  test "should get edit" do
    get edit_sensor_reading_url(@sensor_reading)
    assert_response :success
  end

  test "should update sensor_reading" do
    patch sensor_reading_url(@sensor_reading), params: { sensor_reading: { sensor_type_id: @sensor_reading.sensor_type_id, reading: @sensor_reading.reading, sensor_array_id: @sensor_reading.sensor_array_id } }
    assert_redirected_to sensor_reading_url(@sensor_reading)
  end

  test "should destroy sensor_reading" do
    assert_difference('SensorReading.count', -1) do
      delete sensor_reading_url(@sensor_reading)
    end

    assert_redirected_to sensor_readings_url
  end
end
