class AddFullnameToClient < ActiveRecord::Migration
  def change
    add_column :clients, :fullname, :string, null: false
    add_index :clients, :fullname
  end
end
