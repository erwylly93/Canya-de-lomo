require 'test_helper'

class Admin::BrandsControllerTest < ActionController::TestCase

  setup do
    @brand = brands(:one)
    @controller = Admin::BrandController.new
    @request = ActionController::TestRequest.new
    @response = ActionController::TestResponse.new
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:brands)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create brand" do
    assert_difference('Brand.count') do
      post :create, :brand => { :name => 'Navidul', 
                              :street => 'Calle Jamona', 
                              :city => 'Ciudad Jamona', 
                              :province => 'Provincia Jamona', 
                              :phone => '123456789'}
    end

    assert_response :redirect
    assert_redirected_to :action => 'index'

  end

  test "should show brand" do
    get :show, id: @brand
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @brand
    assert_response :success
  end

  test "should update brand" do

    post :update, :id => 980190962, :brand => { :name => 'Joseph' }
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => 980190962
    assert_equal 'Joseph', Brand.find(980190962).name

  end

  test "should destroy brand" do
    assert_difference('Brand.count', -1) do
      delete :destroy, id: @brand
    end

    assert_redirected_to admin_brand_path
  end
end