require 'test_helper'

class SearchControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get search_url, params: {query: ""}
    assert_response :success
  end

end
