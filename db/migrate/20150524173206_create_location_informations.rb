class CreateLocationInformations < ActiveRecord::Migration
  def change
    create_table :location_informations do |t|
      t.string :pattern
      t.string :interior
      t.string :sale_price
      t.string :land
      t.string :construction_size
      t.string :lot
      t.boolean :excess
      t.string :over_cost
      t.string :promo
      t.string :final_sale_price
      t.references :dossier, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
