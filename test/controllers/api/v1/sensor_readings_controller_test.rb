require 'test_helper'

class Api::V1::SensorReadingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sensor_reading = sensor_reading(:one)
    @sensor_array = sensor_arrays(:aft)
  end
end
