class CreateGeneralSpouseCheckLists < ActiveRecord::Migration
  def change
    create_table :general_spouse_check_lists do |t|
      t.boolean :marriage_certificate, default: false
      t.boolean :ife, default: false
      t.boolean :birth_certificate, default: false
      t.references :dossier, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
