require 'test_helper'

class Backend::GroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @backend_group = backend_groups(:one)
  end

  test "should get index" do
    get backend_groups_url
    assert_response :success
  end

  test "should get new" do
    get new_backend_group_url
    assert_response :success
  end

  test "should create backend_group" do
    assert_difference('Backend::Group.count') do
      post backend_groups_url, params: { backend_group: { description: @backend_group.description, is_active: @backend_group.is_active, is_public: @backend_group.is_public, name: @backend_group.name } }
    end

    assert_redirected_to backend_group_url(Backend::Group.last)
  end

  test "should show backend_group" do
    get backend_group_url(@backend_group)
    assert_response :success
  end

  test "should get edit" do
    get edit_backend_group_url(@backend_group)
    assert_response :success
  end

  test "should update backend_group" do
    patch backend_group_url(@backend_group), params: { backend_group: { description: @backend_group.description, is_active: @backend_group.is_active, is_public: @backend_group.is_public, name: @backend_group.name } }
    assert_redirected_to backend_group_url(@backend_group)
  end

  test "should destroy backend_group" do
    assert_difference('Backend::Group.count', -1) do
      delete backend_group_url(@backend_group)
    end

    assert_redirected_to backend_groups_url
  end
end
