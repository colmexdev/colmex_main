class AddLigaToDocumentos < ActiveRecord::Migration
  def change
    add_column :documentos, :liga, :text
  end
end
