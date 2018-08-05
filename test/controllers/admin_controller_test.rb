require 'test_helper'

class AdminControllerTest < ActionDispatch::IntegrationTest
  include Warden::Test::Helpers
  test "should get index admin" do
    @user = users(:one)
    login_as(@user, :role => :admin)
    @user.confirmed_at = Time.zone.now
    get admin_index_url
    assert_response :success
  end

  test "should get index non-admin" do
    @user = users(:two)
    login_as(@user, :role => :user)
    @user.confirmed_at = Time.zone.now
    get admin_index_url
    assert_response :redirect
  end

end
