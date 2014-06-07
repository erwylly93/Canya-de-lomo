class Product < ActiveRecord::Base
	acts_as_taggable # Alias for acts_as_taggable_on :tags

	attr_accessible :name, :brand_id, :brand, :type, :description, :origin, :price, 
					:cover_image, :suppliers, :supplier_ids, :weight

	has_and_belongs_to_many :suppliers
	belongs_to :brand

	has_many :cart_items
	has_many :carts, :through => :cart_items

	has_attached_file :cover_image, :styles => { :resize => "300x300>" }

	validates_presence_of :name, :brand_id, :price, :weight
	validates_length_of :name, :in => 2..255
	validates_length_of :description, :in => 5..5000, :allow_blank => true
	validates_length_of :origin, :in => 2..255, :allow_blank => true
	validates_numericality_of :price, :greater_than_or_equal_to => 0
	validates_numericality_of :weight, :greater_than => 0

	# En la tabla productos hay una columna que se llama type, y es un tipo reservado. Así se "sobrecarga" 
	# (si no cambiar nombre de la columna):
	self.inheritance_column = :_type_disabled

	def supplier_names
    	self.suppliers.map{|supplier| supplier.name}.join(", ")
  	end

  	def self.latest(num)
    	find :all, :limit => num, :order => "products.id desc", :include => [:suppliers, :brand]
  	end

	def getname
		return name
	end

	def getprice
		return price
	end

	def getweight
		return weight
	end

	def gettype
		return type
	end

	def getorigin
		return origin
	end

	def getdescription
		return description
	end
end
