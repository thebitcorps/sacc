class AddMainPhoneToClient < ActiveRecord::Migration
  def change
    add_column :clients, :main_phone_id, :integer
  end
end
