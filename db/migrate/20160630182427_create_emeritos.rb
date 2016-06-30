class CreateEmeritos < ActiveRecord::Migration
  def change
    create_table :emeritos do |t|
      t.string :nombre, null: false
      t.date :fecha_anexion, null: false
      t.string :centro, null: false
      t.text :semblanza, null: true

      t.timestamps null: false
    end
  end
end
