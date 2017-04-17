class AddEngToCatedra < ActiveRecord::Migration
  def change
    add_column :catedras, :titulo_eng, :text
    add_column :catedras, :descripcion_eng, :text
  end
end
