class AddOffspringsAndDependentsToClient < ActiveRecord::Migration
  def change
    add_column :clients, :offsprings, :integer
    add_column :clients, :dependents, :integer
  end
end
