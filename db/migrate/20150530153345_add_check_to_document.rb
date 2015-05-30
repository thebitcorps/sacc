class AddCheckToDocument < ActiveRecord::Migration
  def change
    add_column :documents, :check, :boolean, default: false
  end
end
