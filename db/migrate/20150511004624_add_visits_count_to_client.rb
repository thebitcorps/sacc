class AddVisitsCountToClient < ActiveRecord::Migration
  def change
    add_column :clients, :visits_count, :integer, default: 0
  end
end
