class AddFechasToConvocatoriaps < ActiveRecord::Migration
  def change
    add_column :convocatoriaps, :fecha_ic, :date
    add_column :convocatoriaps, :fecha_fc, :date
  end
end
