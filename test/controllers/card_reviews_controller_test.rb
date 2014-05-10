require 'test_helper'

class CardReviewsControllerTest < ActionController::TestCase
  setup do
    @card_review = card_reviews(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:card_reviews)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create card_review" do
    assert_difference('CardReview.count') do
      post :create, card_review: { card_id: @card_review.card_id, ease: @card_review.ease, interval: @card_review.interval, rating: @card_review.rating, time: @card_review.time, type: @card_review.type, user_id: @card_review.user_id }
    end

    assert_redirected_to card_review_path(assigns(:card_review))
  end

  test "should show card_review" do
    get :show, id: @card_review
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @card_review
    assert_response :success
  end

  test "should update card_review" do
    patch :update, id: @card_review, card_review: { card_id: @card_review.card_id, ease: @card_review.ease, interval: @card_review.interval, rating: @card_review.rating, time: @card_review.time, type: @card_review.type, user_id: @card_review.user_id }
    assert_redirected_to card_review_path(assigns(:card_review))
  end

  test "should destroy card_review" do
    assert_difference('CardReview.count', -1) do
      delete :destroy, id: @card_review
    end

    assert_redirected_to card_reviews_path
  end
end
