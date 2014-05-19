require 'test_helper'
require 'admin/supplier_controller'

class Admin::SuppliersControllerTest < ActionController::TestCase

  setup do
    @supplier = suppliers(:supplier1)
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
      post :create, :supplier => { 	:name => 'Navidul', 
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

    post :update, :id => 1, :supplier => { :name => 'Proveedor nuevo' }
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => 1
    assert_equal 'Proveedor nuevo', Supplier.find(1).name

  end

  test "should destroy supplier" do
    assert_difference('Supplier.count', -1) do
      delete :destroy, id: @supplier
    end
	assert_equal flash[:notice], "El proveedor Proveedor 1 ha sido borrado."
	assert_response :redirect
    assert_redirected_to :action => 'index'
  end
end
