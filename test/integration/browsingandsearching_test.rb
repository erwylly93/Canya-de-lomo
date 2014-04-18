require 'test_helper'

class BrowsingAndSearchingTest < ActionDispatch::IntegrationTest
  fixtures :brands, :suppliers, :products, :products_suppliers
  
  test "browsing the site" do
		jill = new_session_as(:jill)
		jill.browse_index
		jill.go_to_second_page
		jill.searches_for_tolstoy
		jill.views_latest_products
		jill.reads_rss

	end
	
	def test_getting_details
		jill = new_session_as(:jill)
		jill.get_product_details_for "Producto 1"
	end

	
	module BrowsingTestDSL
		include ERB::Util
		attr_writer :name
		
		def browse_index
			get "/catalog"
			assert_response :success
			assert_template "catalog/index"
			# There are 10 products at dl id=products 
			assert_tag :tag => "dl", :attributes => { :id => "products" },
								 :children => { :count => 10, :only => {:tag => "dt"}}
			assert_tag :tag => "dt", :content => "Producto 1"
			check_product_links
		end
		
		def go_to_second_page
			get "/catalog?page=2"
			assert_response :success
			assert_template "catalog/index"
			assert_equal Product.find_by_name("Producto 1"), assigns(:products)#Product.all
			check_product_links
		end
		
		def get_product_details_for(name)
			@product = Product.find_by_name(name)
			get "/catalog/show/#{@product.id}"
			assert_response :success
			assert_template "catalog/show"
			assert_tag :tag => "h1",
			:content => @product.name
		end
		
		def searches_for_tolstoy
			proveedor = Supplier.find_by_name("Proveedor 1")
			get "/catalog/search?q=#{url_encode("Proveedor 1")}"
			assert_response :success
			assert_template "catalog/search"
			assert_tag :tag => "dl", :attributes => { :id => "products" }, :children => { :count => proveedor.products.size, :only => {:tag => "dt"}}
			proveedor.products.each do |product|
				assert_tag :tag => "dt", :content => product.name
			end
		end
  
		def views_latest_products
			get 'catalog/latest'
			assert_response :success
			assert_template 'catalog/latest'
			assert_tag :tag => 'dl', :attributes => { :id => 'products' },
								 :children => { :count => 10, :only => { :tag => 'dt' } }
			@products = Product.latest(10)
			@products.each do |a|
				assert_tag :tag => 'dt', :content => a.name
			end
			check_product_links
		end

		def reads_rss
			get "/catalog/rss"
			assert_response :success
			assert_template "catalog/rss"
			assert_equal "application/xml", response.headers["type"]
			assert_tag :tag => "channel", :children => { :count => 10, :only => {:tag => "item"}}
			Product.latest.each do |product|
				assert_tag :tag => "title", :content => product.name
			end
		end

		
		def check_product_links
			for product in assigns(:products)
				assert_tag :tag => "a", :attributes => { :href => "/catalog/show/#{product.id}"}
			end
		end

	end
  
	def new_session_as(name)
    open_session do |session|
      session.extend(BrowsingTestDSL)
      session.name = name
      yield session if block_given?
    end
  end
end
