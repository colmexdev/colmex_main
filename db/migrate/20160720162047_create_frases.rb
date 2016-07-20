class CreateFrases < ActiveRecord::Migration
  def change
    create_table :frases do |t|
      t.text :cita
      t.string :autor

      t.timestamps null: false
    end
  end
end
