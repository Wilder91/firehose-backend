require "test_helper"

class DemographicCardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @demographic_card = demographic_cards(:one)
  end

  test "should get index" do
    get demographic_cards_url, as: :json
    assert_response :success
  end

  test "should create demographic_card" do
    assert_difference("DemographicCard.count") do
      post demographic_cards_url, params: { demographic_card: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show demographic_card" do
    get demographic_card_url(@demographic_card), as: :json
    assert_response :success
  end

  test "should update demographic_card" do
    patch demographic_card_url(@demographic_card), params: { demographic_card: {  } }, as: :json
    assert_response :success
  end

  test "should destroy demographic_card" do
    assert_difference("DemographicCard.count", -1) do
      delete demographic_card_url(@demographic_card), as: :json
    end

    assert_response :no_content
  end
end
