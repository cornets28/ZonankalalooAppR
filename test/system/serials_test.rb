require "application_system_test_case"

class SerialsTest < ApplicationSystemTestCase
  setup do
    @serial = serials(:one)
  end

  test "visiting the index" do
    visit serials_url
    assert_selector "h1", text: "Serials"
  end

  test "creating a Serial" do
    visit serials_url
    click_on "New Serial"

    fill_in "Maintitle", with: @serial.mainTitle
    click_on "Create Serial"

    assert_text "Serial was successfully created"
    click_on "Back"
  end

  test "updating a Serial" do
    visit serials_url
    click_on "Edit", match: :first

    fill_in "Maintitle", with: @serial.mainTitle
    click_on "Update Serial"

    assert_text "Serial was successfully updated"
    click_on "Back"
  end

  test "destroying a Serial" do
    visit serials_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Serial was successfully destroyed"
  end
end
