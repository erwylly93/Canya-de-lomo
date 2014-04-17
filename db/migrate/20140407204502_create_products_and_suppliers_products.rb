class CreateProductsAndSuppliersProducts < ActiveRecord::Migration
  def up
  	create_table :products do |t|
  		t.column :name, :string, :null => false
  		t.column :brand_id, :integer, :null => false
  		t.column :type, :string
  		t.column :description, :text
  		t.column :origin, :string
  		t.column :price, :float
      	t.column :weight, :float
  		t.timestamps
  	end

  	create_table :products_suppliers do |t|
  		t.column :supplier_id, :integer, :null => false
  		t.column :product_id, :integer, :null => false
  	end

  	say_with_time 'Adding foreing keys' do
      # Add foreign key reference to products_suppliers table
      execute 'ALTER TABLE products_suppliers ADD CONSTRAINT fk_products_suppliers_suppliers
              FOREIGN KEY (supplier_id) REFERENCES suppliers(id) ON DELETE CASCADE'      
      execute 'ALTER TABLE products_suppliers ADD CONSTRAINT fk_products_suppliers_products
              FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE'
      # Add foreign key reference to brands table
      execute 'ALTER TABLE products ADD CONSTRAINT fk_products_brands
              FOREIGN KEY (brand_id) REFERENCES brands(id) ON DELETE CASCADE'
    end
  end

  def down
    drop_table :products_suppliers
  	drop_table :products
  end
end
