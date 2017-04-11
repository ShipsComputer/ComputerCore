require 'test_helper'

class SensorTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sensor_type = sensor_types(:temperature)
  end

  test "should get index" do
    get sensor_types_url
    assert_response :success
  end

  test "should get new" do
    get new_sensor_type_url
    assert_response :success
  end

  test "should create sensor_type" do
    assert_difference('SensorType.count') do
      post sensor_types_url, params: { sensor_type: { handle: @sensor_type.handle } }
    end

    assert_redirected_to sensor_type_url(SensorType.last)
  end

  test "should show sensor_type" do
    get sensor_type_url(@sensor_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_sensor_type_url(@sensor_type)
    assert_response :success
  end

  test "should update sensor_type" do
    patch sensor_type_url(@sensor_type), params: { sensor_type: { handle: @sensor_type.handle } }
    assert_redirected_to sensor_type_url(@sensor_type)
  end

  test "should destroy sensor_type" do
    assert_difference('SensorType.count', -1) do
      delete sensor_type_url(@sensor_type)
    end

    assert_redirected_to sensor_types_url
  end
end
