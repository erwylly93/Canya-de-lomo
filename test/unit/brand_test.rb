require 'test_helper'

class BrandTest < ActiveSupport::TestCase
 
  def test_name
  	brand = Brand.new(:name => 'Hnos Tortugo', :street => 'C/Tortugo', :city => 'Tortuga', :province => 'Tortugalandia', :phone => '987654321')
  	assert_equal 'Hnos Tortugo', brand.getname
  end

  def test_street
  	brand = Brand.new(:name => 'Hnos Tortugo', :street => 'C/Tortugo', :city => 'Tortuga', :province => 'Tortugalandia', :phone => '987654321')
  	assert_equal 'C/Tortugo', brand.getstreet
  end

  def test_city
  	brand = Brand.new(:name => 'Hnos Tortugo', :street => 'C/Tortugo', :city => 'Tortuga', :province => 'Tortugalandia', :phone => '987654321')
  	assert_equal 'Tortuga', brand.getcity
  end

  def test_province
  	brand = Brand.new(:name => 'Hnos Tortugo', :street => 'C/Tortugo', :city => 'Tortuga', :province => 'Tortugalandia', :phone => '987654321')
  	assert_equal 'Tortugalandia', brand.getprovince
  end

  def test_phone
  	brand = Brand.new(:name => 'Hnos Tortugo', :street => 'C/Tortugo', :city => 'Tortuga', :province => 'Tortugalandia', :phone => '987654321')
  	assert_equal '987654321', brand.getphone
  end

end
