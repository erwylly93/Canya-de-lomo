class Cart < ActiveRecord::Base
  attr_accessible :cart_items

  has_many :cart_items
  has_many :products, :through => :cart_items

  def total
  	cart_items.inject(0) { |sum, item| item.price * item.amount + sum }
  end

  def add(product_id, amount = 1)
    items = cart_items.find_all_by_product_id(product_id)
    product = Product.find(product_id)
    if items.size < 1
      ci = cart_items.create(:product_id => product_id, :amount => amount, :price => product.price)
    else
      ci = items.first
      ci.update_attribute(:amount, ci.amount + amount)
    end
    ci
  end

  def remove(product_id, amount = 1)
    ci = cart_items.find_by_product_id(product_id)
    if ci.amount - amount > 0
      ci.update_attribute(:amount, ci.amount - amount)
    else
      CartItem.destroy(ci.id)
    end
    ci
  end
end
