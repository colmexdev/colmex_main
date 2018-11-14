class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.text :nombre null: false
      t.text :centro null: false
      t.text :viaf
      t.text :orcid
      t.text :isni
      t.text :cvu
      t.text :sitio
      t.text :extension
      t.text :temas_esp null: false
      t.text :temas_ing null: false

      t.timestamps null: false
    end
  end
end
