class AddCargoEngToAutoridades < ActiveRecord::Migration
  def change
    add_column :personal, :cargo_eng, :text
    add_column :personal, :depto_eng, :text
  end
end
