class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
	  # Información de contacto
      t.string :email
      t.string :phone_number
      # Dirección de envío
      t.string :ship_to_first_name
      t.string :ship_to_last_name
      t.string :ship_to_address
      t.string :ship_to_city
      t.string :ship_to_postal_code
      t.string :ship_to_country_code
      # Campos privados
      t.string :customer_ip
      t.string :status
      t.string :error_message
      t.timestamps
    end
  end
end
