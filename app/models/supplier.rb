class Supplier < ActiveRecord::Base
	attr_accessible :name, :street, :city, :phone
	validates_presence_of :name, :street, :city

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