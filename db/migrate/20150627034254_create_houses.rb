class CreateHouses < ActiveRecord::Migration
  def change
    create_table :houses do |t|
      t.string :block
      t.integer :interior
      t.string :prototype
      t.decimal :land_size
      t.decimal :common_area
      t.decimal :undivided
      t.decimal :selling_area
      t.decimal :lot_type
      t.decimal :land_oversize
      t.decimal :proposed_price
      t.decimal :corner
      t.decimal :sale_price_compound
      t.integer :stage
      t.integer :production
      t.string :status,default: 'available'

      t.timestamps null: false
    end
  end
end
