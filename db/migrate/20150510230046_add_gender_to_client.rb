class AddGenderToClient < ActiveRecord::Migration
  def change
    add_column :clients, :gender, :boolean
  end
end
