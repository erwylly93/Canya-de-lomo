class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.column :name, :string, :unique => true, :null => false
      t.column :phone, :string, :limit => 9
      t.column :city, :string
      t.column :province, :string
      t.column :street, :string
      t.timestamps
    end
  end
end