require 'test_helper'

class CartControllerTest < ActionController::TestCase
  
  test "adding" do
		assert_difference 'CartItem.count' do
			post :add, :id => 4, :amount => 1
		end
		
		assert_response :redirect
		assert_redirected_to :controller => "catalog"
		assert_equal 1, Cart.find(@request.session[:cart_id]).cart_items.size
  end
  
  test "adding with xhr" do
		assert_difference('CartItem.count') do
			xhr :post, :add, :id => 5
		end
		assert_response :success
		assert_equal 1, Cart.find(@request.session[:cart_id]).cart_items.size
	end
  
  test "removing" do
		post :add, :id => 4, :amount => 1
		assert_equal [Product.find(4)], Cart.find(@request.session[:cart_id]).products
		post :remove, :id => 4, :amount => 1
		assert_equal [], Cart.find(@request.session[:cart_id]).products
	end
	
	test "test removing with xhr" do
		post :add, :id => 4, :amount => 1
		assert_equal [Product.find(4)], Cart.find(@request.session[:cart_id]).products
		xhr :post, :remove, :id => 4
		assert_equal [], Cart.find(@request.session[:cart_id]).products
	end

	
	test "clearing" do
		post :add, :id => 4, :amount => 1
		assert_equal [Product.find(4)], Cart.find(@request.session[:cart_id]).products
		post :clear
		assert_response :redirect
		assert_redirected_to :controller => "catalog"
		assert_equal [], Cart.find(@request.session[:cart_id]).products
	end
	
	test "clearing with xhr" do
		post :add, :id => 4, :amount => 1
		assert_equal [Product.find(4)], Cart.find(@request.session[:cart_id]).products
		xhr :post, :clear
		assert_response :success
		assert_equal 0, Cart.find(@request.session[:cart_id]).cart_items.size
	end

end
