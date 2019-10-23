require "application_system_test_case"

class Backend::GroupsTest < ApplicationSystemTestCase
  setup do
    @backend_group = backend_groups(:one)
  end

  test "visiting the index" do
    visit backend_groups_url
    assert_selector "h1", text: "Backend/Groups"
  end

  test "creating a Group" do
    visit backend_groups_url
    click_on "New Backend/Group"

    fill_in "Description", with: @backend_group.description
    check "Is active" if @backend_group.is_active
    check "Is public" if @backend_group.is_public
    fill_in "Name", with: @backend_group.name
    click_on "Create Group"

    assert_text "Group was successfully created"
    click_on "Back"
  end

  test "updating a Group" do
    visit backend_groups_url
    click_on "Edit", match: :first

    fill_in "Description", with: @backend_group.description
    check "Is active" if @backend_group.is_active
    check "Is public" if @backend_group.is_public
    fill_in "Name", with: @backend_group.name
    click_on "Update Group"

    assert_text "Group was successfully updated"
    click_on "Back"
  end

  test "destroying a Group" do
    visit backend_groups_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Group was successfully destroyed"
  end
end
