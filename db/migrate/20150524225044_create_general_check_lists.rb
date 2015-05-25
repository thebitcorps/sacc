class CreateGeneralCheckLists < ActiveRecord::Migration
  def change
    create_table :general_check_lists do |t|
      t.boolean :bank_request
      t.boolean :ife
      t.boolean :address_proof
      t.boolean :birth_certificate

      t.timestamps null: false
    end
  end
end
