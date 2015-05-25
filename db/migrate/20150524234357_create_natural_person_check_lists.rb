class CreateNaturalPersonCheckLists < ActiveRecord::Migration
  def change
    create_table :natural_person_check_lists do |t|
      t.boolean :fiscal_statements
      t.boolean :finance_registration
      t.boolean :rfc
      t.boolean :annual_return

      t.timestamps null: false
    end
  end
end
