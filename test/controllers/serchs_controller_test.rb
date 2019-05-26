require 'test_helper'

class SerchsControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get serchs_search_url
    assert_response :success
  end

end
