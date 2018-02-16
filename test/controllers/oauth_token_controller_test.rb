require 'test_helper'

class OauthTokenControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get oauth_token_index_url
    assert_response :success
  end

end
