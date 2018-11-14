class AddCorreoToTeacher < ActiveRecord::Migration
  def change
    add_column :teachers, :correo, :text
  end
end
