class AddAttachmentFotoToAddFotoToCursos < ActiveRecord::Migration
  def self.up
    change_table :add_foto_to_cursos do |t|
      t.attachment :foto
    end
  end

  def self.down
    remove_attachment :add_foto_to_cursos, :foto
  end
end
