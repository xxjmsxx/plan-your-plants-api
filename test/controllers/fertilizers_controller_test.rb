require "test_helper"

class FertilizersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get fertilizers_index_url
    assert_response :success
  end

  test "should get show" do
    get fertilizers_show_url
    assert_response :success
  end

  test "should get create" do
    get fertilizers_create_url
    assert_response :success
  end

  test "should get update" do
    get fertilizers_update_url
    assert_response :success
  end

  test "should get destroy" do
    get fertilizers_destroy_url
    assert_response :success
  end
end
