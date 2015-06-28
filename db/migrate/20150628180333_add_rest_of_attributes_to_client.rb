class AddRestOfAttributesToClient < ActiveRecord::Migration
  def change
    add_column :clients, :current_place, :string
    add_column :clients, :address, :string
    add_column :clients, :division, :string
    add_column :clients, :town, :string
    add_column :clients, :total_incume, :decimal
    add_column :clients, :spouse_birtdate, :date
    add_column :clients, :pathway, :string
    add_column :clients, :sales_channel, :string
    add_column :clients, :status, :string
    add_column :clients, :qualifies, :boolean
  end
end
