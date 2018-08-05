require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  include Warden::Test::Helpers
  test "should get home" do
    get "/"
    assert_response :success
  end

  test "should get account" do
    @user = users(:two)
    login_as(@user, :role => :user)
    @user.confirmed_at = Time.zone.now
    get "/account"
    assert_response :success
  end

  test "should get redirected from account" do
    get "/account"
    assert_response :redirect
  end

end
