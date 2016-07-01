class CreateSliders < ActiveRecord::Migration
  def change
    create_table :sliders do |t|
      t.text :liga

      t.timestamps null: false
    end
  end
end
