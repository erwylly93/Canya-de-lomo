require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  fixtures :products
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
 	 	
 	def test_ferret
		 assert Product.search :name_contains => 'Producto 1'

		 assert_difference 'Product.count' do
      product = Product.new :name => 'Producto test_ferret',
														:type => 'Tipo 1',
														:description => 'Descripcion producto 1',
														:origin => 'Origen producto 1',
														:price => 12.0,
														:weight => 2.0
      product.suppliers << Supplier.create(:name => 'SupplierFerret', :street => 'C/Tortugo', :city => 'Tortuga', :province => 'Tortugalandia', :phone => '987654321')
      product.brand = Brand.find(1)
      assert product.valid?
      product.save
     end

     assert_equal 1, Product.search(:name_contains => 'Producto_test_ferret').count
     assert_equal 1, Supplier.search(:name_contains => 'SupplierFerret').count
	end

	def test_tagging
		product = products(:product1)
		
		product.tag_list.add("awe", "some")
		product.save
		product.reload
		assert Product.tagged_with('awe')
		assert Product.tagged_with('some')
		assert_equal 2, product.tag_list.size
		assert_equal ['awe', 'some'], product.tag_list
		assert_equal 1, Product.tagged_with([ 'awe', 'some' ]).size
	end
end

