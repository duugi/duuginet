require 'test_helper'

class Hrms::DepartmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hrms_department = hrms_departments(:one)
  end

  test "should get index" do
    get hrms_departments_url
    assert_response :success
  end

  test "should get new" do
    get new_hrms_department_url
    assert_response :success
  end

  test "should create hrms_department" do
    assert_difference('Hrms::Department.count') do
      post hrms_departments_url, params: { hrms_department: { description: @hrms_department.description, leave_allow_count: @hrms_department.leave_allow_count, max_absent_length: @hrms_department.max_absent_length, max_ppl_absent: @hrms_department.max_ppl_absent, name: @hrms_department.name } }
    end

    assert_redirected_to hrms_department_url(Hrms::Department.last)
  end

  test "should show hrms_department" do
    get hrms_department_url(@hrms_department)
    assert_response :success
  end

  test "should get edit" do
    get edit_hrms_department_url(@hrms_department)
    assert_response :success
  end

  test "should update hrms_department" do
    patch hrms_department_url(@hrms_department), params: { hrms_department: { description: @hrms_department.description, leave_allow_count: @hrms_department.leave_allow_count, max_absent_length: @hrms_department.max_absent_length, max_ppl_absent: @hrms_department.max_ppl_absent, name: @hrms_department.name } }
    assert_redirected_to hrms_department_url(@hrms_department)
  end

  test "should destroy hrms_department" do
    assert_difference('Hrms::Department.count', -1) do
      delete hrms_department_url(@hrms_department)
    end

    assert_redirected_to hrms_departments_url
  end
end
