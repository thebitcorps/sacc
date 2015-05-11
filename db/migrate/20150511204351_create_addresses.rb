class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :external_number
      t.string :internal_number
      t.string :colony
      t.integer :zip_code
      t.references :client, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
