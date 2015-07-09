class CreateNegociations < ActiveRecord::Migration
  def change
    create_table :negociations do |t|
      t.references :client, index: true, foreign_key: true
      t.references :house, index: true, foreign_key: true
      t.integer :authorized_by, index: true, foreign_key: true
      t.decimal :final_price
      t.integer :months
      t.date :due
      t.date :signature_date
      t.string :witness1
      t.string :witness2
      t.boolean :done

      t.timestamps null: false
    end
  end
end
