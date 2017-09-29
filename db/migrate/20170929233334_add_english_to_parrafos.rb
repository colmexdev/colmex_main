class AddEnglishToParrafos < ActiveRecord::Migration
  def change
    add_column :parrafos, :texto_ingles, :text
  end
end
