class Cart < ActiveRecord::Base
  has_many :cart_items
  has_many :products, :through => :cart_items

  def total
  	cart_items.inject(0) { |sum, item| item.price * item.amount + sum }
  end

  def add(product_id)
    items = cart_items.find_all_by_product_id(product_id)
    product = Product.find(product_id)
    if items.size < 1
      ci = cart_items.create(:product_id => product_id, :amount => 1, :price => product.price)
    else
      ci = items.first
      ci.update_attribute(:amount, ci.amount + 1)
    end
    ci
  end

  def remove(product_id)
    ci = cart_items.find_by_product_id(product_id) 
    if ci.amount > 1
      ci.update_attribute(:amount, ci.amount - 1)
    else
      CartItem.destroy(ci.id)
    end
    ci
  end
end
