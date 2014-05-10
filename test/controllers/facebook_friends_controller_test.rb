require 'test_helper'

class FacebookFriendsControllerTest < ActionController::TestCase
  setup do
    @facebook_friend = facebook_friends(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:facebook_friends)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create facebook_friend" do
    assert_difference('FacebookFriend.count') do
      post :create, facebook_friend: { birthday: @facebook_friend.birthday, college: @facebook_friend.college, facebook_id: @facebook_friend.facebook_id, location: @facebook_friend.location, name: @facebook_friend.name, photo: @facebook_friend.photo, significant_other: @facebook_friend.significant_other, user_id: @facebook_friend.user_id, work: @facebook_friend.work }
    end

    assert_redirected_to facebook_friend_path(assigns(:facebook_friend))
  end

  test "should show facebook_friend" do
    get :show, id: @facebook_friend
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @facebook_friend
    assert_response :success
  end

  test "should update facebook_friend" do
    patch :update, id: @facebook_friend, facebook_friend: { birthday: @facebook_friend.birthday, college: @facebook_friend.college, facebook_id: @facebook_friend.facebook_id, location: @facebook_friend.location, name: @facebook_friend.name, photo: @facebook_friend.photo, significant_other: @facebook_friend.significant_other, user_id: @facebook_friend.user_id, work: @facebook_friend.work }
    assert_redirected_to facebook_friend_path(assigns(:facebook_friend))
  end

  test "should destroy facebook_friend" do
    assert_difference('FacebookFriend.count', -1) do
      delete :destroy, id: @facebook_friend
    end

    assert_redirected_to facebook_friends_path
  end
end
