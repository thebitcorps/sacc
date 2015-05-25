class CreateGeneralCheckLists < ActiveRecord::Migration
  def change
    create_table :general_check_lists do |t|
      t.boolean :bank_request, default: false
      t.boolean :ife, default: false
      t.boolean :address_proof, default: false
      t.boolean :birth_certificate, default: false
      t.references :dossier, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
