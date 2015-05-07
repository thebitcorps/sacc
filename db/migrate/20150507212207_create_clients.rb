class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :first_name
      t.string :paternal_name
      t.string :maternal_name
      t.string :curp
      t.string :imss
      t.string :spouse
      t.date :birthdate
      t.string :mail
      t.decimal :income
      t.text :notes
      t.string :workplace
      t.integer :current_salesman_id

      t.timestamps null: false
    end
  end
end
