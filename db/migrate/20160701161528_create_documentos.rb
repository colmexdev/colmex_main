class CreateDocumentos < ActiveRecord::Migration
  def change
    create_table :documentos do |t|
      t.text :nombre
      t.string :tipo
      t.integer :anio

      t.timestamps null: false
    end
  end
end
