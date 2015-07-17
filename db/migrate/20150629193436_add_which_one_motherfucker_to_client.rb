class AddWhichOneMotherfuckerToClient < ActiveRecord::Migration
  def change
    add_column :clients, :which_one, :string
  end
end
