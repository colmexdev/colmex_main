class CreateParrafos < ActiveRecord::Migration
  def change
    create_table :parrafos do |t|
      t.belongs_to :sitio, index: true
      t.text :texto
      t.integer :p_ind

      t.timestamps null: false
    end
  end
end
