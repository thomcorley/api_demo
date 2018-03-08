require 'test_helper'

class IndexControllerTest < ActionDispatch::IntegrationTest
  test "should get authorize" do
    get index_authorize_url
    assert_response :success
  end

end
