class AddCountersToClient < ActiveRecord::Migration
  def change
    add_column :clients, :interactions_count, :integer, default: 0
    add_column :clients, :appointments_count, :integer, default: 0
  end
end
