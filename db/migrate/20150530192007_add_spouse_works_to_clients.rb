class AddSpouseWorksToClients < ActiveRecord::Migration
  def change
    add_column :clients, :spouse_works, :boolean
  end
end
