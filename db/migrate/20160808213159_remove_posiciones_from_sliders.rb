class RemovePosicionesFromSliders < ActiveRecord::Migration
  def change
    remove_column :sliders, :pos_x, :float
    remove_column :sliders, :pos_y, :float
    add_column 	  :sliders, :posicion, :string 
  end
end
