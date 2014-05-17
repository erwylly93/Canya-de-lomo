class AddPwResetCodeToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :pw_reset_code, :string, :limit => 40
  end
end
