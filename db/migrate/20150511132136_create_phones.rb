class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.string :number
      t.string :kind
      t.time :available_from
      t.time :available_to
      t.belongs_to :client, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
