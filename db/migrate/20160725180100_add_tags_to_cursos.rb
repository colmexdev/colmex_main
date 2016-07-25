class AddTagsToCursos < ActiveRecord::Migration
  def change
    add_column :cursos, :tags, :text
  end
end
