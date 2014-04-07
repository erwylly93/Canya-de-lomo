class Supplier < ActiveRecord::Base
	attr_accessible :name, :street, :city, :phone

	has_and_belongs_to_many :products
	
	validates_presence_of :name, :street, :city, :phone
	validates_length_of :name, :in => 2..255
	validates_length_of :street, :in => 5..255
	validates_length_of :city, :in => 2..255
	validates_length_of :phone, :is => 9
	validates_uniqueness_of :name

	def getname
		"#{name}"
	end

	def getaddress
		"#{street}, #{city}"
	end

	def getphone
		"#{phone}"
	end
end