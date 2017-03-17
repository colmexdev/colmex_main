class AddFraseToFrases < ActiveRecord::Migration
  def change
    add_column :frases, :cita_eng, :text
  end
end
