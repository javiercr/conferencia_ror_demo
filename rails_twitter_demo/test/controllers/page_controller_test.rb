require 'test_helper'

class PageControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get page_index_url
    assert_response :success
  end

  test "should get timeline" do
    get page_timeline_url
    assert_response :success
  end

end
