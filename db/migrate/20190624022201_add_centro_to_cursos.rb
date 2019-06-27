class AddCentroToCursos < ActiveRecord::Migration
  def change
    add_column :cursos, :centro, :text
  end
end
