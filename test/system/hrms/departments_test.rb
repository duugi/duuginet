require "application_system_test_case"

class Hrms::DepartmentsTest < ApplicationSystemTestCase
  setup do
    @hrms_department = hrms_departments(:one)
  end

  test "visiting the index" do
    visit hrms_departments_url
    assert_selector "h1", text: "Hrms/Departments"
  end

  test "creating a Department" do
    visit hrms_departments_url
    click_on "New Hrms/Department"

    fill_in "Description", with: @hrms_department.description
    fill_in "Leave allow count", with: @hrms_department.leave_allow_count
    fill_in "Max absent length", with: @hrms_department.max_absent_length
    fill_in "Max ppl absent", with: @hrms_department.max_ppl_absent
    fill_in "Name", with: @hrms_department.name
    click_on "Create Department"

    assert_text "Department was successfully created"
    click_on "Back"
  end

  test "updating a Department" do
    visit hrms_departments_url
    click_on "Edit", match: :first

    fill_in "Description", with: @hrms_department.description
    fill_in "Leave allow count", with: @hrms_department.leave_allow_count
    fill_in "Max absent length", with: @hrms_department.max_absent_length
    fill_in "Max ppl absent", with: @hrms_department.max_ppl_absent
    fill_in "Name", with: @hrms_department.name
    click_on "Update Department"

    assert_text "Department was successfully updated"
    click_on "Back"
  end

  test "destroying a Department" do
    visit hrms_departments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Department was successfully destroyed"
  end
end
