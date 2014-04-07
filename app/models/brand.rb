class Brand < ActiveRecord::Base
  	attr_accessible :name, :street, :city, :phone

  	has_many :products

	validates_presence_of :name, :street, :city, :phone
	validates_length_of :name, :in => 2..255
	validates_length_of :street, :in => 5..255
	validates_length_of :city, :in => 2..255
	validates_length_of :phone, :is => 9
	validates_uniqueness_of :name
end
