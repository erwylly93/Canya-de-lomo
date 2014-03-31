class Supplier < ActiveRecord::Base
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