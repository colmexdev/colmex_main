class AddTipoEngToContents < ActiveRecord::Migration
  def change
    add_column :contents, :tipo_eng, :text
  end
end
