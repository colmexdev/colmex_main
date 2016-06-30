class CreateImagens < ActiveRecord::Migration
  def change
    create_table :imagens do |t|
      t.text :texto_pie, null: true
      t.string :galeria, null: false
      t.string :categoria_premio, null: false

      t.timestamps null: false
    end
  end
end
