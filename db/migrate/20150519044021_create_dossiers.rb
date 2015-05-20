class CreateDossiers < ActiveRecord::Migration
  def change
    create_table :dossiers do |t|
      t.references :client, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
