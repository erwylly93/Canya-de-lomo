class CreateSuppliers < ActiveRecord::Migration
  def change
    create_table :suppliers do |t|
      t.string :name
      t.string :street
      t.string :city
      t.string :phone, :limit => 9	
      t.timestamps
    end
  end
end