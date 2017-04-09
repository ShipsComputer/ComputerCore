require 'test_helper'

class EnvironmentalReadingTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @environmental_reading_type = environmental_reading_types(:temperature)
  end

  test "should get index" do
    get environmental_reading_types_url
    assert_response :success
  end

  test "should get new" do
    get new_environmental_reading_type_url
    assert_response :success
  end

  test "should create environmental_reading_type" do
    assert_difference('EnvironmentalReadingType.count') do
      post environmental_reading_types_url, params: { environmental_reading_type: { handle: @environmental_reading_type.handle } }
    end

    assert_redirected_to environmental_reading_type_url(EnvironmentalReadingType.last)
  end

  test "should show environmental_reading_type" do
    get environmental_reading_type_url(@environmental_reading_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_environmental_reading_type_url(@environmental_reading_type)
    assert_response :success
  end

  test "should update environmental_reading_type" do
    patch environmental_reading_type_url(@environmental_reading_type), params: { environmental_reading_type: { handle: @environmental_reading_type.handle } }
    assert_redirected_to environmental_reading_type_url(@environmental_reading_type)
  end

  test "should destroy environmental_reading_type" do
    assert_difference('EnvironmentalReadingType.count', -1) do
      delete environmental_reading_type_url(@environmental_reading_type)
    end

    assert_redirected_to environmental_reading_types_url
  end
end
