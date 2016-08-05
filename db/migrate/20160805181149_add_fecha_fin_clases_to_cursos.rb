class AddFechaFinClasesToCursos < ActiveRecord::Migration
  def change
    add_column :cursos, :fecha_fin_clases, :date
  end
end
