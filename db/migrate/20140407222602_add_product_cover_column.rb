class AddProductCoverColumn < ActiveRecord::Migration
  def up
  	add_attachment :products, :cover_image
  end

  def down
  	remove_attachment :products, :cover_image
  end
end