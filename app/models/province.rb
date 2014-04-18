class Province < ActiveRecord::Base
	attr_accessible :id, :province, :cities
	has_many :cities
end
