class AddLigaToPremiados < ActiveRecord::Migration
  def change
    add_column :premiados, :liga, :text
  end
end
