class AddAttachmentFotoToAcademicos < ActiveRecord::Migration
  def self.up
    change_table :academicos do |t|
      t.attachment :foto
    end
  end

  def self.down
    remove_attachment :academicos, :foto
  end
end
