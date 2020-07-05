require "application_system_test_case"

class VenuesTest < ApplicationSystemTestCase
  setup do
    @venue = venues(:one)
  end

  test "visiting the index" do
    visit venues_url
    assert_selector "h1", text: "Venues"
  end

  test "creating a Venue" do
    visit venues_url
    click_on "New Venue"

    click_on "Create Venue"

    assert_text "Venue was successfully created"
    click_on "Back"
  end

  test "updating a Venue" do
    visit venues_url
    click_on "Edit", match: :first

    click_on "Update Venue"

    assert_text "Venue was successfully updated"
    click_on "Back"
  end

  test "destroying a Venue" do
    visit venues_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Venue was successfully destroyed"
  end
end
