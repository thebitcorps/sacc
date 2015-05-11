class AddCounterToClient < ActiveRecord::Migration
  def change
    add_column :clients, :appointments_count, :integer, default: 0
  end
end
