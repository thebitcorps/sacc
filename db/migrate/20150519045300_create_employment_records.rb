class CreateEmploymentRecords < ActiveRecord::Migration
  def change
    create_table :employment_records do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.string :extension
      t.integer :zip_code
      t.string :position
      t.string :email
      t.integer :seniority
      t.decimal :income
      t.string :type
      t.references :dossier, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
