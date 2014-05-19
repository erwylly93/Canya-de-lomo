class CreateSuppliers < ActiveRecord::Migration
  def change
    create_table :suppliers do |t|
      t.string :name , :unique => true , :null => false
      t.string :street
      t.string :city
      t.string :province
      t.string :phone, :limit => 9	
      t.timestamps
    end
  end
end