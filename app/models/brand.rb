class Brand < ActiveRecord::Base
  	attr_accessible :name, :street, :city, :phone
	validates_presence_of :name, :street, :city, :phone
end
