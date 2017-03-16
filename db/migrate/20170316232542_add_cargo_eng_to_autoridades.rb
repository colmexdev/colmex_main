class AddCargoEngToAutoridades < ActiveRecord::Migration
  def change
    add_column :personals, :cargo_eng, :text
    add_column :personals, :depto_eng, :text
  end
end
