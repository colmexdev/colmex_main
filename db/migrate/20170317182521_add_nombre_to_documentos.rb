class AddNombreToDocumentos < ActiveRecord::Migration
  def change
    add_column :documentos, :nombre_eng, :text
  end
end
