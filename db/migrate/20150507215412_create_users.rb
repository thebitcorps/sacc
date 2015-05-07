class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :paternal_lastname
      t.string :maternal_lastname
      t.string :cellphone
      t.boolean :gender

      t.timestamps null: false
    end
  end
end
