require 'test_helper'

class MaintainancesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get maintainances_new_url
    assert_response :success
  end

  test "should get index" do
    get maintainances_index_url
    assert_response :success
  end

  test "should get show" do
    get maintainances_show_url
    assert_response :success
  end

  test "should get edit" do
    get maintainances_edit_url
    assert_response :success
  end

end
