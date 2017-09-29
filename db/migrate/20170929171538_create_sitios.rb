class CreateSitios < ActiveRecord::Migration
  def change
    create_table :sitios do |t|
      t.text :ref
      t.text :partial

      t.timestamps null: false
    end
  end
end
