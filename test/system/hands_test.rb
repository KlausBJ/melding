require "application_system_test_case"

class HandsTest < ApplicationSystemTestCase
  setup do
    @hand = hands(:one)
  end

  test "visiting the index" do
    visit hands_url
    assert_selector "h1", text: "Hands"
  end

  test "should create hand" do
    visit hands_url
    click_on "New hand"

    click_on "Create Hand"

    assert_text "Hand was successfully created"
    click_on "Back"
  end

  test "should update Hand" do
    visit hand_url(@hand)
    click_on "Edit this hand", match: :first

    click_on "Update Hand"

    assert_text "Hand was successfully updated"
    click_on "Back"
  end

  test "should destroy Hand" do
    visit hand_url(@hand)
    click_on "Destroy this hand", match: :first

    assert_text "Hand was successfully destroyed"
  end
end
