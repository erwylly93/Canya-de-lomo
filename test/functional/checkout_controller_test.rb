require 'test_helper'

class CheckoutControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :redirect
    assert_redirected_to :controller => 'catalog', :action => 'index'
  end

  test "should get thank_you" do
    get :thank_you
    assert_response :success
  end

end
