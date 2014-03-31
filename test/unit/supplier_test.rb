require File.dirname(__FILE__) + '/../test_helper'  

class SupplierTest < ActiveSupport::TestCase
  def test_name
  	supplier = Supplier.create(:name => 'Proveedor')
    assert_equal 'Proveedor', supplier.getname
  end

  def test_address
  	supplier = Supplier.create(:street => 'Calle prueba', :city => 'Ciudad')
  	assert_equal 'Calle prueba, Ciudad', supplier.getaddress
  end

  def test_phone
  	supplier = Supplier.create(:phone => '123456789')
  	assert_equal supplier.phone.length, 9
  end 
end