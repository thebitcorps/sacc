class CreateWageCheckLists < ActiveRecord::Migration
  def change
    create_table :wage_check_lists do |t|
      t.boolean :payroll_statements, default: false
      t.boolean :payslips, default: false
      t.boolean :labor_letter, default: false
      t.references :dossier, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
