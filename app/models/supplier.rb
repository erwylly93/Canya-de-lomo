class Supplier < ActiveRecord::Base
	attr_accessible :name, :street, :city, :province, :phone

	has_and_belongs_to_many :products
	
  validates_presence_of :name
  validates_length_of :name, :in => 2..255
  validates_length_of :street, :in => 5..255, :allow_blank => true
  validates_length_of :city, :in => 2..255, :allow_blank => true
  validates_length_of :province, :in => 2..255, :allow_blank => true
  validates_length_of :phone, :is => 9, :allow_blank => true
  validates_uniqueness_of :name
  

  def getname
  	return name
  end

  def getstreet
  	return street
  end

  def getcity
  	return city
  end

  def getprovince
  	return province
  end

  def getphone
  	return phone
  end
end