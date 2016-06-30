class CreateDescubres < ActiveRecord::Migration
  def change
    create_table :descubres do |t|
      t.text :titulo
      t.text :descripcion
      t.text :liga
      t.text :contenido

      t.timestamps null: false
    end
  end
end
