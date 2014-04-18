require 'test_helper'

class Admin::ProductsControllerTest < ActionController::TestCase
  setup do
    @product = products(:product1)
    @controller = Admin::ProductController.new
    @request = ActionController::TestRequest.new
    @response = ActionController::TestResponse.new
  end

  test "get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
  end

  test "cargar new" do
    get :new
    assert_response :success
  end

  test "create" do
    num_products = Product.count
    post :create, :product => { :name => 'Jamon iberico', 
								:brand_id => Brand.find(1).id,
								:supplier_ids => Supplier.find(:all),
								:description => 'A great ham',
								:weight => 3.75,
								:price => 45.5,
								:origin => 'Extremadura' }
    assert_response :redirect
    assert_redirected_to :action => 'index'
    assert_equal num_products + 1, Product.count
  end

  test "should show product" do
    get :show, id: @product.id
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product
    assert_response :success
  end

  test "update" do
    post :update, :id => 1, :product => { 	:name => 'The ham of Ruby',
											:brand_id => Brand.find(1).id,
											:supplier_ids => Supplier.find(:all),
											:description => 'A great ham',
											:weight => 3.75,
											:price => 45.5,
											:origin => 'Extremadura' }
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => 1
    assert_equal 'The ham of Ruby', Product.find(1).name
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete :destroy, id: @product.id
    end
    assert_equal flash[:notice], 'El producto Producto 1 ha sido borrado.'
    assert_response :redirect
    assert_redirected_to :action => 'index'
    get :index
    assert_response :success
    assert_tag :tag => 'div', :attributes => {:id => 'notice'},
                 :content => 'El producto Producto 1 ha sido borrado.'
  end
end
