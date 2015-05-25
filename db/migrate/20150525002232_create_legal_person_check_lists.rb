class CreateLegalPersonCheckLists < ActiveRecord::Migration
  def change
    create_table :legal_person_check_lists do |t|
      t.boolean :business_statements, default: false
      t.boolean :personal_statements, default: false
      t.boolean :charter, default: false
      t.boolean :personal_rfc, default: false
      t.boolean :business_rfc, default: false
      t.boolean :business_finance_registration, default: false
      t.boolean :personal_finance_registration, default: false
      t.boolean :annual_return, default: false
      t.boolean :financial_statements, default: false
      t.references :dossier, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
