class AddInterestedHouseToClient < ActiveRecord::Migration
  def change
    add_reference :clients, :house, index: true, foreign_key: true
  end
end
