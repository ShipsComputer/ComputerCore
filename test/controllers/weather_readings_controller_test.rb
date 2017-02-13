require 'test_helper'

class WeatherReadingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @weather_reading = weather_readings(:one)
  end

  test "should get index" do
    get weather_readings_url
    assert_response :success
  end

  test "should get new" do
    get new_weather_reading_url
    assert_response :success
  end

  test "should create weather_reading" do
    assert_difference('WeatherReading.count') do
      post weather_readings_url, params: { weather_reading: { humidity: @weather_reading.humidity, pressure: @weather_reading.pressure, sensor_array_id: @weather_reading.sensor_array_id, temp: @weather_reading.temp } }
    end

    assert_redirected_to weather_reading_url(WeatherReading.last)
  end

  test "should show weather_reading" do
    get weather_reading_url(@weather_reading)
    assert_response :success
  end

  test "should get edit" do
    get edit_weather_reading_url(@weather_reading)
    assert_response :success
  end

  test "should update weather_reading" do
    patch weather_reading_url(@weather_reading), params: { weather_reading: { humidity: @weather_reading.humidity, pressure: @weather_reading.pressure, sensor_array_id: @weather_reading.sensor_array_id, temp: @weather_reading.temp } }
    assert_redirected_to weather_reading_url(@weather_reading)
  end

  test "should destroy weather_reading" do
    assert_difference('WeatherReading.count', -1) do
      delete weather_reading_url(@weather_reading)
    end

    assert_redirected_to weather_readings_url
  end
end
