class AddMainToPhone < ActiveRecord::Migration
  def change
    add_column :phones, :is_main, :boolean, default: false
  end
end
