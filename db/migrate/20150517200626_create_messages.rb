class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :phone_number
      t.string :body
      t.date :to_date
      t.time :to_time

      t.timestamps null: false
    end
  end
end
