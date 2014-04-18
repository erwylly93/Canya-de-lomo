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
=begin 	
 	def test_ferret
		 assert Product.search :name_contains => 'Producto 1'

    assert_difference Product, :count do
      product = Product.new :name => 'Producto 1',
														:type => 'Tipo 1',
														:description => 'Descripcion producto 1',
														:origin => 'Origen producto 1',
														:price => 12.0,
														:weight => 2.0
      product.suppliers << Supplier.create(:name => "Proveedor 41")
      product.brand = Brand.find(1)
      assert product.valid?
      product.save

      assert_equal 1, Product.search(:name_contains => 'Producto').count
      assert_equal 1, Product.search(:suppliers_name_contains => 'Proveedor').count
		end
	end
=end

end

