class RemoveMainPhoneIdFromClient < ActiveRecord::Migration
  def change
    remove_column :clients, :main_phone_id, :string
  end
end
