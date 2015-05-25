class CreateWageCheckLists < ActiveRecord::Migration
  def change
    create_table :wage_check_lists do |t|
      t.boolean :payroll_statements
      t.boolean :payslips
      t.boolean :labor_letter

      t.timestamps null: false
    end
  end
end
