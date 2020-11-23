require "application_system_test_case"

class ItusersTest < ApplicationSystemTestCase
  setup do
    @ituser = itusers(:one)
  end

  test "visiting the index" do
    visit itusers_url
    assert_selector "h1", text: "Itusers"
  end

  test "creating a Ituser" do
    visit itusers_url
    click_on "New Ituser"

    fill_in "Birthday", with: @ituser.birthday
    fill_in "Email", with: @ituser.email
    fill_in "Name", with: @ituser.name
    fill_in "Password", with: @ituser.password
    click_on "Create Ituser"

    assert_text "Ituser was successfully created"
    click_on "Back"
  end

  test "updating a Ituser" do
    visit itusers_url
    click_on "Edit", match: :first

    fill_in "Birthday", with: @ituser.birthday
    fill_in "Email", with: @ituser.email
    fill_in "Name", with: @ituser.name
    fill_in "Password", with: @ituser.password
    click_on "Update Ituser"

    assert_text "Ituser was successfully updated"
    click_on "Back"
  end

  test "destroying a Ituser" do
    visit itusers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Ituser was successfully destroyed"
  end
end
