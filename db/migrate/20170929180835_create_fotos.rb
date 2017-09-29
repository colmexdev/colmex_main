class CreateFotos < ActiveRecord::Migration
  def change
    create_table :fotos do |t|
      t.belongs_to :sitio, index: true
      t.integer :index
      t.attachment :foto

      t.timestamps null: false
    end
  end
end
