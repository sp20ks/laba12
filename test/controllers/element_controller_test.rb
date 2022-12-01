require "test_helper"

class ElementControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get element_index_url
    assert_response :success
  end

  test "should get result" do
    get element_result_url
    assert_response :success
  end

  test "should get show_all" do
    get element_show_all_url
    assert_response :success
  end
end
