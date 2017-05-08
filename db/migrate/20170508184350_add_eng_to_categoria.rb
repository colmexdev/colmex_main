class AddEngToCategoria < ActiveRecord::Migration
  def change
    add_column :categoria, :nombre_eng, :text
  end
end
