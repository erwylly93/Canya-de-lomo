class CartItem < ActiveRecord::Base
  attr_accessible :product_id, :cart_id, :price, :amount
  
  belongs_to :cart
  belongs_to :product
end
