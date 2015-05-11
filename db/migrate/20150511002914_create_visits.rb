class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.references :client, index: true, foreign_key: true
      t.text :notes
      t.integer :mood
      t.integer :interest

      t.timestamps null: false
    end
  end
end
