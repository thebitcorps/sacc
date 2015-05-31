class AddCompletedToInteraction < ActiveRecord::Migration
  def change
    add_column :interactions, :completed, :boolean, default: false
    add_column :interactions, :position, :integer, default: 0
  end
end
