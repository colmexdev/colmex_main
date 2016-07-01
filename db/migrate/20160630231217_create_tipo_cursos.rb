class CreateTipoCursos < ActiveRecord::Migration
  def change
    create_table :tipo_cursos do |t|
      t.string :tipo, null: false

      t.timestamps null: false
    end
  end
end
