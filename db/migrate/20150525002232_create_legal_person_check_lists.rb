class CreateLegalPersonCheckLists < ActiveRecord::Migration
  def change
    create_table :legal_person_check_lists do |t|
      t.boolean :business_statements
      t.boolean :personal_statements
      t.boolean :charter
      t.boolean :personal_rfc
      t.boolean :business_rfc
      t.boolean :business_finance_registration
      t.boolean :personal_finance_registration
      t.boolean :annual_return
      t.boolean :financial_statements

      t.timestamps null: false
    end
  end
end
