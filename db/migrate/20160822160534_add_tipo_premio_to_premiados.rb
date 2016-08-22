class AddTipoPremioToPremiados < ActiveRecord::Migration
  def change
    add_column :premiados, :tipo_premio, :string
  end
end
