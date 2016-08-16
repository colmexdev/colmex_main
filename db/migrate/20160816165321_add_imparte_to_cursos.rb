class AddImparteToCursos < ActiveRecord::Migration
  def change
    add_column :cursos, :imparte, :text
  end
end
