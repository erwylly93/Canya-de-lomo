class Brand < ActiveRecord::Base
  	attr_accessible :name, :street, :city, :province, :phone

  	has_many :products

	validates_presence_of :name
	validates_length_of :name, :in => 5..255
	validates_length_of :street, :in => 10..255, :allow_blank => true
	validates_length_of :city, :in => 4..255, :allow_blank => true
	validates_length_of :province, :in => 4..255, :allow_blank => true
	validates_length_of :phone, :is => 9
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
