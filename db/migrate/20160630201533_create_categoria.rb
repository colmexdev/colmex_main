class CreateCategoria < ActiveRecord::Migration
  def change
    create_table :categoria do |t|
      t.text :nombre, null: false

      t.timestamps null: false
    end
  end
end
