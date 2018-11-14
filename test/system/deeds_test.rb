require "application_system_test_case"

class DeedsTest < ApplicationSystemTestCase
  setup do
    @deed = deeds(:one)
  end

  test "visiting the index" do
    visit deeds_url
    assert_selector "h1", text: "Deeds"
  end

  test "creating a Deed" do
    visit deeds_url
    click_on "New Deed"

    click_on "Create Deed"

    assert_text "Deed was successfully created"
    click_on "Back"
  end

  test "updating a Deed" do
    visit deeds_url
    click_on "Edit", match: :first

    click_on "Update Deed"

    assert_text "Deed was successfully updated"
    click_on "Back"
  end

  test "destroying a Deed" do
    visit deeds_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Deed was successfully destroyed"
  end
end
