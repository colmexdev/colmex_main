class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.integer :sitio_id
      t.integer :ord_index

      t.timestamps null: false
    end
  end
end
