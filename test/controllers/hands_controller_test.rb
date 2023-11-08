require "test_helper"

class HandsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hand = hands(:one)
  end

  test "should get index" do
    get hands_url
    assert_response :success
  end

  test "should get new" do
    get new_hand_url
    assert_response :success
  end

  test "should create hand" do
    assert_difference("Hand.count") do
      post hands_url, params: { hand: {  } }
    end

    assert_redirected_to hand_url(Hand.last)
  end

  test "should show hand" do
    get hand_url(@hand)
    assert_response :success
  end

  test "should get edit" do
    get edit_hand_url(@hand)
    assert_response :success
  end

  test "should update hand" do
    patch hand_url(@hand), params: { hand: {  } }
    assert_redirected_to hand_url(@hand)
  end

  test "should destroy hand" do
    assert_difference("Hand.count", -1) do
      delete hand_url(@hand)
    end

    assert_redirected_to hands_url
  end
end
