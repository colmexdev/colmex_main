class CreateCatedras < ActiveRecord::Migration
  def change
    create_table :catedras do |t|
      t.text :titulo
      t.text :descripcion
      t.text :liga
      t.string :tipo

      t.timestamps null: false
    end
  end
end
