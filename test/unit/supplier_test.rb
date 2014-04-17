
require 'test_helper'

class SupplierTest < ActiveSupport::TestCase
 
  def test_name
    supplier = Supplier.new(:name => 'Hnos Tortugo', :street => 'C/Tortugo', :city => 'Tortuga', :province => 'Tortugalandia', :phone => '987654321')
    assert_equal 'Hnos Tortugo', supplier.getname
  end

  def test_street
    supplier = Supplier.new(:name => 'Hnos Tortugo', :street => 'C/Tortugo', :city => 'Tortuga', :province => 'Tortugalandia', :phone => '987654321')
    assert_equal 'C/Tortugo', supplier.getstreet
  end

  def test_city
    supplier = Supplier.new(:name => 'Hnos Tortugo', :street => 'C/Tortugo', :city => 'Tortuga', :province => 'Tortugalandia', :phone => '987654321')
    assert_equal 'Tortuga', supplier.getcity
  end

  def test_province
    supplier = Supplier.new(:name => 'Hnos Tortugo', :street => 'C/Tortugo', :city => 'Tortuga', :province => 'Tortugalandia', :phone => '987654321')
    assert_equal 'Tortugalandia', supplier.getprovince
  end

  def test_phone
    supplier = Supplier.new(:name => 'Hnos Tortugo', :street => 'C/Tortugo', :city => 'Tortuga', :province => 'Tortugalandia', :phone => '987654321')
    assert_equal '987654321', supplier.getphone
  end

end
