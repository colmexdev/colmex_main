class AddTraduccionTituloToCursos < ActiveRecord::Migration
  def change
    add_column :cursos, :traduccion_tit, :text
  end
end
