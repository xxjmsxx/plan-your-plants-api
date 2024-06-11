require "test_helper"

class GardenPlantsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get garden_plants_index_url
    assert_response :success
  end

  test "should get show" do
    get garden_plants_show_url
    assert_response :success
  end

  test "should get create" do
    get garden_plants_create_url
    assert_response :success
  end

  test "should get update" do
    get garden_plants_update_url
    assert_response :success
  end

  test "should get destroy" do
    get garden_plants_destroy_url
    assert_response :success
  end
end
