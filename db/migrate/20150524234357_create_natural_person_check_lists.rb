class CreateNaturalPersonCheckLists < ActiveRecord::Migration
  def change
    create_table :natural_person_check_lists do |t|
      t.boolean :fiscal_statements, default: false
      t.boolean :finance_registration, default: false
      t.boolean :rfc, default: false
      t.boolean :annual_return, default: false
      t.references :dossier, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
