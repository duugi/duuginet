require 'test_helper'

class Backend::LocationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @backend_location = backend_locations(:one)
  end

  test "should get index" do
    get backend_locations_url
    assert_response :success
  end

  test "should get new" do
    get new_backend_location_url
    assert_response :success
  end

  test "should create backend_location" do
    assert_difference('Backend::Location.count') do
      post backend_locations_url, params: { backend_location: { country_code: @backend_location.country_code, description: @backend_location.description, is_active: @backend_location.is_active, name: @backend_location.name, state_code: @backend_location.state_code, timezone_code: @backend_location.timezone_code } }
    end

    assert_redirected_to backend_location_url(Backend::Location.last)
  end

  test "should show backend_location" do
    get backend_location_url(@backend_location)
    assert_response :success
  end

  test "should get edit" do
    get edit_backend_location_url(@backend_location)
    assert_response :success
  end

  test "should update backend_location" do
    patch backend_location_url(@backend_location), params: { backend_location: { country_code: @backend_location.country_code, description: @backend_location.description, is_active: @backend_location.is_active, name: @backend_location.name, state_code: @backend_location.state_code, timezone_code: @backend_location.timezone_code } }
    assert_redirected_to backend_location_url(@backend_location)
  end

  test "should destroy backend_location" do
    assert_difference('Backend::Location.count', -1) do
      delete backend_location_url(@backend_location)
    end

    assert_redirected_to backend_locations_url
  end
end
