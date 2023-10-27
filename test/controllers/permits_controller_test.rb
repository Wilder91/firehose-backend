require "test_helper"

class PermitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @permit = permits(:one)
  end

  test "should get index" do
    get permits_url, as: :json
    assert_response :success
  end

  test "should create permit" do
    assert_difference("Permit.count") do
      post permits_url, params: { permit: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show permit" do
    get permit_url(@permit), as: :json
    assert_response :success
  end

  test "should update permit" do
    patch permit_url(@permit), params: { permit: {  } }, as: :json
    assert_response :success
  end

  test "should destroy permit" do
    assert_difference("Permit.count", -1) do
      delete permit_url(@permit), as: :json
    end

    assert_response :no_content
  end
end
