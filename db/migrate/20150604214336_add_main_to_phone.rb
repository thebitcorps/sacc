class AddMainToPhone < ActiveRecord::Migration
  def change
    add_column :phones, :main, :boolean, default: true
  end
end
