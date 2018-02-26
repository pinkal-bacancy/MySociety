require 'test_helper'

class SocietiesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get societies_new_url
    assert_response :success
    
  end

end
