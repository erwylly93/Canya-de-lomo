require 'test_helper'

class ProductTest < ActionDispatch::IntegrationTest

  test "product_aministration" do
    brand = Brand.create(	:name => 'Marca #1', 
							:street => 'Calle marca #1', 
							:city => 'Ciudad marca #1', 
							:province => 'Provincia marca #1', 
							:phone => '987654321')
							
    supplier = Supplier.create(	:name => 'Proveedor #1', 
								:street => 'Calle proveedor #1', 
								:city => 'Ciudad proveedor #1', 
								:province => 'Provincia proveedor #1', 
								:phone => '956748392') 		
	# Simulations
						
	# George logs in
    george = new_session_as(:george)

	# George creates a new product called 'Producto 1'
    new_product_ruby = george.add_product :product => {
      :name => 'Producto 1',
      :brand_id => brand.id,
      :type => 'Tipo 1',
      :description => 'Descripcion producto 1',
      :origin => 'Origen producto 1',
      :price => 12.0, 
      :supplier_ids => [supplier.id],
      :weight => 2.0
    }
	
	# George lists products
    george.list_products
    
    # George does click on 'Producto 1'
    george.show_product new_product_ruby

	# George edits 'Producto 1'
    george.edit_product new_product_ruby, :product => {
      :name => 'Producto 2',
      :type => 'Tipo 2',
      :description => 'Descripcion producto 2',
      :origin => 'Origen producto 2',
      :price => 13,
      :weight => 2.5
    }

	# Bob logs in
    bob = new_session_as(:bob)
    # Bob deletes 'Producto 1'
    bob.delete_product new_product_ruby
  end

  private

  module ProductTestDSL
    attr_writer :name

    def add_product(parameters)
      supplier = Supplier.find(:all).first
      brand = Brand.find(:all).first
      
      get '/admin/product/new'
      assert_response :success
      assert_template 'admin/product/new'
      
      assert_tag :tag => 'option', :attributes => { :value => brand.id }
      assert_tag :tag => 'select', :attributes => { :name => 'product[supplier_ids][]' }
      
      post '/admin/product/create', parameters
      assert_response :redirect
      follow_redirect!
      assert_response :success
      assert_template 'admin/product/index'
      
      page = Product.find(:all).count / 5 + 1
      get "/admin/product/index/?page=#{page}"
      
      assert_tag :tag => 'td', :content => parameters[:product][:name]
      return Product.find_by_name(parameters[:product][:name])
    end

    def edit_product(product, parameters)
      get "admin/product/edit?id=#{product.id}"
      assert_response :success
      assert_template 'admin/product/edit'
      
      post "/admin/product/update?id=#{product.id}", parameters
      assert_response :redirect
      follow_redirect!
      assert_response :success
      assert_template 'admin/product/show'
    end

    def delete_product(product)
      post "/admin/product/destroy?id=#{product.id}"
      assert_response :redirect
      follow_redirect!
      assert_response :success
      assert_template 'admin/product/index'
    end

    def show_product(product)
      get "/admin/product/show/#{product.id}"
      assert_response :success
      assert_template 'admin/product/show'
    end

    def list_products
      get 'admin/product/index'
      assert_response :success
      assert_template 'admin/product/index'
    end
  end

  def new_session_as(name)
    open_session do |session|
      session.extend(ProductTestDSL)
      session.name = name
      yield session if block_given?
    end
  end
end
