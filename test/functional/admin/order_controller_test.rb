require 'test_helper'

class Admin::OrderControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show, :id => 1
    assert_response :success
  end

  test "should get close" do
    get :close, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'index'
  end

end
