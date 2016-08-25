class CreateAcademicos < ActiveRecord::Migration
  def change
    create_table :academicos do |t|
      t.text :nombre
      t.string :adscripcion
      t.text :lineas_investigacion
      t.string :correo
      t.text :pagina

      t.timestamps null: false
    end
  end
end
