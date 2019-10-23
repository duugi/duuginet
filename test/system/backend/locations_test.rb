require "application_system_test_case"

class Backend::LocationsTest < ApplicationSystemTestCase
  setup do
    @backend_location = backend_locations(:one)
  end

  test "visiting the index" do
    visit backend_locations_url
    assert_selector "h1", text: "Backend/Locations"
  end

  test "creating a Location" do
    visit backend_locations_url
    click_on "New Backend/Location"

    fill_in "Country code", with: @backend_location.country_code
    fill_in "Description", with: @backend_location.description
    check "Is active" if @backend_location.is_active
    fill_in "Name", with: @backend_location.name
    fill_in "State code", with: @backend_location.state_code
    fill_in "Timezone code", with: @backend_location.timezone_code
    click_on "Create Location"

    assert_text "Location was successfully created"
    click_on "Back"
  end

  test "updating a Location" do
    visit backend_locations_url
    click_on "Edit", match: :first

    fill_in "Country code", with: @backend_location.country_code
    fill_in "Description", with: @backend_location.description
    check "Is active" if @backend_location.is_active
    fill_in "Name", with: @backend_location.name
    fill_in "State code", with: @backend_location.state_code
    fill_in "Timezone code", with: @backend_location.timezone_code
    click_on "Update Location"

    assert_text "Location was successfully updated"
    click_on "Back"
  end

  test "destroying a Location" do
    visit backend_locations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Location was successfully destroyed"
  end
end
