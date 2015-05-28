class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :title
      t.string :attatchment
      t.boolean :original
      t.references :dossier, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
