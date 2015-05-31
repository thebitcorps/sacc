class AddCreditTypeAndFiscalEntityToClient < ActiveRecord::Migration
  def change
    add_column :clients, :credit_type, :string
    add_column :clients, :fiscal_entity, :string
  end
end
