class CreatePersonals < ActiveRecord::Migration
  def change
    create_table :personals do |t|
      t.text :nombre
      t.string :seccion
      t.text :correo
      t.text :telefono
      t.text :extension
      t.text :cargo
      t.text :depto

      t.timestamps null: false
    end
  end
end
