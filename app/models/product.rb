class Product < ActiveRecord::Base
	attr_accessible :name, :brand_id, :brand, :type, :description, :origin, :price, 
					:cover_image, :suppliers, :supplier_ids

	has_and_belongs_to_many :suppliers
	belongs_to :brand

	has_attached_file :cover_image

	validates_presence_of :name, :brand_id, :price
	validates_length_of :name, :in => 2..255
	validates_length_of :description, :in => 0..5000
	validates_length_of :origin, :in => 2..255
	validates_numericality_of :price, :greater_than_or_equal_to => 0

	# En la tabla productos hay una columna que se llama type, y es un tipo reservado. Así se "sobrecarga" 
	# (si no cambiar nombre de la columna):
	self.inheritance_column = :_type_disabled

	def supplier_names
    	self.suppliers.map{|supplier| supplier.name}.join(", ")
  	end
end