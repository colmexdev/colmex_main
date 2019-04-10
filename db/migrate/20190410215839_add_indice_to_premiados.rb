class AddIndiceToPremiados < ActiveRecord::Migration
  def change
    add_column :premiados, :indice, :integer
  end
end
