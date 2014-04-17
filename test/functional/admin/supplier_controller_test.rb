require 'test_helper'

class Admin::SuppliersControllerTest < ActionController::TestCase

  setup do
    @supplier = suppliers(:one)
    @controller = Admin::SupplierController.new
    @request = ActionController::TestRequest.new
    @response = ActionController::TestResponse.new
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:suppliers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create supplier" do
    assert_difference('Supplier.count') do
      post :create, :supplier => { :name => 'Navidul', 
                              :street => 'Calle Jamona', 
                              :city => 'Ciudad Jamona', 
                              :province => 'Provincia Jamona', 
                              :phone => '123456789'}
    end

    assert_response :redirect
    assert_redirected_to :action => 'index'

  end

  test "should show supplier" do
    get :show, id: @supplier
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @supplier
    assert_response :success
  end

  test "should update supplier" do

    post :update, :id => 980190962, :supplier => { :name => 'Joseph' }
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => 980190962
    assert_equal 'Joseph', Supplier.find(980190962).name

  end

  test "should destroy supplier" do
    assert_difference('Supplier.count', -1) do
      delete :destroy, id: @supplier
    end

    assert_redirected_to admin_supplier_path
  end
end