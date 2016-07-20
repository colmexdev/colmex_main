class CreatePremiados < ActiveRecord::Migration
  def change
    create_table :premiados do |t|
      t.text :nombre
      t.text :descripcion
      t.string :tipo

      t.timestamps null: false
    end
  end
end
