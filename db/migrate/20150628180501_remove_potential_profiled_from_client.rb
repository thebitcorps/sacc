class RemovePotentialProfiledFromClient < ActiveRecord::Migration
  def change
    remove_column :clients, :profiled, :string
    remove_column :clients, :potential, :string
  end
end
