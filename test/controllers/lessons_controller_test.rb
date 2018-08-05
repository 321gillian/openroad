require 'test_helper'

class LessonsControllerTest < ActionDispatch::IntegrationTest
  include Warden::Test::Helpers
  test "should get index signed in admin" do
    @user = users(:one)
    login_as(@user, :role => :admin)
    @user.confirmed_at = Time.zone.now
    get "/lessons"
    assert_response :success
  end


  test "should get index signed in user" do
    @user = users(:one)
    login_as(@user, :role => :user)
    @user.confirmed_at = Time.zone.now
    get "/lessons"
    assert_response :success
  end


  test "should get index when not signed ins" do
    get "/lessons"
    assert_response :redirect
  end

end
