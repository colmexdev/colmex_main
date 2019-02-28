class CreateBeneficiaries < ActiveRecord::Migration
  def change
    create_table :beneficiaries do |t|
      t.text :nombre
      t.text :proyecto
      t.text :centro
      t.text :correo
      t.text :sitio
      t.integer :extension
      t.text :temas

      t.timestamps null: false
    end
  end
end
