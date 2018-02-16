require 'test_helper'

class ContactsControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get contacts_controller_create_url
    assert_response :success
  end

end
