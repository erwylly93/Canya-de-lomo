class City < ActiveRecord::Base
    attr_accessible :id, :id_province, :cod_city, :DC, :name, :province
 	belongs_to :province
end
