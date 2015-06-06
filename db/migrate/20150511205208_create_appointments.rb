class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.references :client, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.date :date
      t.string :place # en lugar de las notas, el lugar de la cita
      t.time :time
      t.text :notes
      # t.text :notes
      # t.integer :mood
      # t.integer :interest

      t.timestamps null: false
    end
  end
end
