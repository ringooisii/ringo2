require 'test_helper'

class Admin::DiscsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get admin_discs_create_url
    assert_response :success
  end

  test "should get update" do
    get admin_discs_update_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_discs_destroy_url
    assert_response :success
  end

end
