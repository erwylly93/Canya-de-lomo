require 'test_helper'

class CatalogControllerTest < ActionController::TestCase
  fixtures :suppliers, :brands, :products

  setup do
    @brand = brands(:brand1)
    @controller = CatalogController.new
    @request = ActionController::TestRequest.new
    @response = ActionController::TestResponse.new
  end

  test "index" do
    get :index
    assert_response :success
  end

  test "show" do
    get :show, :id => @brand
    assert_response :success
  end

  test "search" do
    get :search
    assert_response :success
  end

  test "latest" do
    get :latest
    assert_response :success
  end

end
