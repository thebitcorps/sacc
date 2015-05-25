class CreateGeneralSpouseCheckLists < ActiveRecord::Migration
  def change
    create_table :general_spouse_check_lists do |t|
      t.boolean :marriage_certificate
      t.boolean :ife
      t.boolean :birth_certificate

      t.timestamps null: false
    end
  end
end
