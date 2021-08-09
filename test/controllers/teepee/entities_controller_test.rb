require "test_helper"

class Teepee::EntitiesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get teepee_entities_path(5)
    assert_response :success
  end
end
