class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.column :name, :string, :unique => true, :null => false
      t.column :phone, :string, :limit => 9, :null => false
      t.column :city, :string
      t.column :street, :string
      t.timestamps
    end
  end
end