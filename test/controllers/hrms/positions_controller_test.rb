require 'test_helper'

class Hrms::PositionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hrms_position = hrms_positions(:one)
  end

  test "should get index" do
    get hrms_positions_url
    assert_response :success
  end

  test "should get new" do
    get new_hrms_position_url
    assert_response :success
  end

  test "should create hrms_position" do
    assert_difference('Hrms::Position.count') do
      post hrms_positions_url, params: { hrms_position: { description: @hrms_position.description, name: @hrms_position.name } }
    end

    assert_redirected_to hrms_position_url(Hrms::Position.last)
  end

  test "should show hrms_position" do
    get hrms_position_url(@hrms_position)
    assert_response :success
  end

  test "should get edit" do
    get edit_hrms_position_url(@hrms_position)
    assert_response :success
  end

  test "should update hrms_position" do
    patch hrms_position_url(@hrms_position), params: { hrms_position: { description: @hrms_position.description, name: @hrms_position.name } }
    assert_redirected_to hrms_position_url(@hrms_position)
  end

  test "should destroy hrms_position" do
    assert_difference('Hrms::Position.count', -1) do
      delete hrms_position_url(@hrms_position)
    end

    assert_redirected_to hrms_positions_url
  end
end
