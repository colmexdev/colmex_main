class AddFieldsToSitios < ActiveRecord::Migration
  def change
    add_column :sitios, :num_parrafos, :integer
    add_column :sitios, :num_fotos, :integer
  end
end
