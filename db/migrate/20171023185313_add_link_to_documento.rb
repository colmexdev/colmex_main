class AddLinkToDocumento < ActiveRecord::Migration
  def change
    add_column :documentos, :link_eng, :text
  end
end
