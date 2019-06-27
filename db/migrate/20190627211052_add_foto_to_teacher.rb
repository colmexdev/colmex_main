class AddFotoToTeacher < ActiveRecord::Migration
  def change
    add_attachment :teachers, :foto
  end
end
