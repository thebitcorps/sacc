class CreateInteractions < ActiveRecord::Migration
  def change
    create_table :interactions do |t|
      t.string :kind
      t.date :date
      t.time :time
      t.integer :mood
      t.integer :interest
      t.references :user, index: true, foreign_key: true
      t.references :client, index: true, foreign_key: true
      t.text :notes

      t.timestamps null: false
    end
  end
end
