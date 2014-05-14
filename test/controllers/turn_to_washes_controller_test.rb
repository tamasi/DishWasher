require 'test_helper'

class TurnToWashesControllerTest < ActionController::TestCase
  setup do
    @turn_to_wash = turn_to_washes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:turn_to_washes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create turn_to_wash" do
    assert_difference('TurnToWash.count') do
      post :create, turn_to_wash: { datename: @turn_to_wash.datename, dateturn: @turn_to_wash.dateturn }
    end

    assert_redirected_to turn_to_wash_path(assigns(:turn_to_wash))
  end

  test "should show turn_to_wash" do
    get :show, id: @turn_to_wash
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @turn_to_wash
    assert_response :success
  end

  test "should update turn_to_wash" do
    patch :update, id: @turn_to_wash, turn_to_wash: { datename: @turn_to_wash.datename, dateturn: @turn_to_wash.dateturn }
    assert_redirected_to turn_to_wash_path(assigns(:turn_to_wash))
  end

  test "should destroy turn_to_wash" do
    assert_difference('TurnToWash.count', -1) do
      delete :destroy, id: @turn_to_wash
    end

    assert_redirected_to turn_to_washes_path
  end
end
