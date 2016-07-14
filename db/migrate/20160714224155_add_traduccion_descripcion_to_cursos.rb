class AddTraduccionDescripcionToCursos < ActiveRecord::Migration
  def change
    add_column :cursos, :traduccion_desc, :text
  end
end
