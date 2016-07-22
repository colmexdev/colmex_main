class AddFechaExpiracionToSliders < ActiveRecord::Migration
  def change
    add_column :sliders, :fecha_expiracion, :date
  end
end
