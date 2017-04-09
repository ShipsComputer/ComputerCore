require 'test_helper'

class EnvironmentalReadingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @environmental_reading = environmental_readings(:one)
  end

  test "should get index" do
    get environmental_readings_url
    assert_response :success
  end

  test "should get new" do
    get new_environmental_reading_url
    assert_response :success
  end

  test "should create environmental_reading" do
    assert_difference('EnvironmentalReading.count') do
      post environmental_readings_url, params: { environmental_reading: { environmental_reading_type_id: @environmental_reading.environmental_reading_type_id, reading: @environmental_reading.reading, sensor_array_id: @environmental_reading.sensor_array_id } }
    end

    assert_redirected_to environmental_reading_url(EnvironmentalReading.last)
  end

  test "should show environmental_reading" do
    get environmental_reading_url(@environmental_reading)
    assert_response :success
  end

  test "should get edit" do
    get edit_environmental_reading_url(@environmental_reading)
    assert_response :success
  end

  test "should update environmental_reading" do
    patch environmental_reading_url(@environmental_reading), params: { environmental_reading: { environmental_reading_type_id: @environmental_reading.environmental_reading_type_id, reading: @environmental_reading.reading, sensor_array_id: @environmental_reading.sensor_array_id } }
    assert_redirected_to environmental_reading_url(@environmental_reading)
  end

  test "should destroy environmental_reading" do
    assert_difference('EnvironmentalReading.count', -1) do
      delete environmental_reading_url(@environmental_reading)
    end

    assert_redirected_to environmental_readings_url
  end
end
