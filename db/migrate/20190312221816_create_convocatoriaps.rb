class CreateConvocatoriaps < ActiveRecord::Migration
  def change
    create_table :convocatoriaps do |t|
      t.text :titulo
      t.attachment :imagen
      t.attachment :documento
      t.text :liga

      t.timestamps null: false
    end
  end
end
