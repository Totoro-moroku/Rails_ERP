require "application_system_test_case"

class SublistTypesTest < ApplicationSystemTestCase
  setup do
    @sublist_type = sublist_types(:one)
  end

  test "visiting the index" do
    visit sublist_types_url
    assert_selector "h1", text: "Sublist Types"
  end

  test "creating a Sublist type" do
    visit sublist_types_url
    click_on "New Sublist Type"

    fill_in "Name", with: @sublist_type.name
    click_on "Create Sublist type"

    assert_text "Sublist type was successfully created"
    click_on "Back"
  end

  test "updating a Sublist type" do
    visit sublist_types_url
    click_on "Edit", match: :first

    fill_in "Name", with: @sublist_type.name
    click_on "Update Sublist type"

    assert_text "Sublist type was successfully updated"
    click_on "Back"
  end

  test "destroying a Sublist type" do
    visit sublist_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sublist type was successfully destroyed"
  end
end
