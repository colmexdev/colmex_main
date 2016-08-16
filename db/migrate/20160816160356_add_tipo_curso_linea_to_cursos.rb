class AddTipoCursoLineaToCursos < ActiveRecord::Migration
  def change
    add_column :cursos, :tipo_curso_linea, :string
  end
end
