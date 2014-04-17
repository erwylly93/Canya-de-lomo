require 'test_helper'

class ProductTest < ActiveSupport::TestCase
 
 	def test_name
 		product = Product.new(:name => 'Zorro curado')
 		assert_equal 'Zorro curado' , product.getname
 	end

 	def test_type
 		product = Product.new(:name => 'Zorro curado', :type => 'Zorruno')
 		assert_equal 'Zorruno' , product.gettype
 	end

 	def test_origin
 		product = Product.new(:name => 'Zorro curado', :origin => 'Zorruno')
 		assert_equal 'Zorruno' , product.getorigin
 	end

 	def test_price
 		product = Product.new(:name => 'Zorro curado', :price => 5.3)
 		assert_equal 5.3 , product.getprice
 	end

 	def test_weight
 		product = Product.new(:name => 'Zorro curado', :weight => 5.4)
 		assert_equal 5.4 , product.getweight
 	end

 	def test_description
 		product = Product.new(:name => 'Zorro curado', :description => 'Zorruno weno weno')
 		assert_equal 'Zorruno weno weno' , product.getdescription
 	end

end

