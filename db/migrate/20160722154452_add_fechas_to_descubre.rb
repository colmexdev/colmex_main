class AddFechasToDescubre < ActiveRecord::Migration
  def change
    remove_column :descubres, :descripcion, :text
    add_column :descubres, :fecha_publicacion, :date
    add_column :descubres, :fecha_limite_pub, :date
  end
end
