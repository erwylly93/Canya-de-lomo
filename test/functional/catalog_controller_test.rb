# encoding: utf-8
require 'test_helper'

class CatalogControllerTest < ActionController::TestCase
  fixtures :suppliers, :brands, :products

  setup do
    @product = products(:product1)
    @controller = CatalogController.new
    @request = ActionController::TestRequest.new
    @response = ActionController::TestResponse.new
  end

  test "index" do
    get :index
    assert_response :success
    assert_tag 'h1', :content => 'Catálogo de productos'
    assert_tag 'p', :content => 'Últimos productos'
    @products = Product.find :all, :order => "products.id desc"
    pages = @products.count / 10
    pages += 1 unless @products.count % 10 == 0
    cont = 1
    page = 1
    @products.each do |a|
      assert_tag :tag => 'dt', :content => a.name
      cont = cont + 1
      if cont > 10 && page < pages  # go to next page
        page = page + 1
        cont = 1
        get :index, :page => page
        assert_response :success
      end
    end
  end

  test "show" do
    get :show, :id => 1
    assert_response :success
    assert_template 'catalog/show'
    assert_equal 'Producto 1', assigns(:product).name
    assert_equal 'Descripcion producto 1', assigns(:product).description
    assert_tag 'h1', :content => Product.find(1).name
  end

  test "search" do
    get :search
    assert_response :success
    assert_tag 'h1', :content => 'Buscar producto'
  end

  test "latest" do
    get :latest
    assert_response :success
    assert_tag 'h1', :content => 'Últimos productos'
    @products = Product.latest 10
    @products.each do |a|
      assert_tag :tag => 'dt', :content => a.name
    end
  end

end
