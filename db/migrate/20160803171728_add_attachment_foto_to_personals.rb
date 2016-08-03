class AddAttachmentFotoToPersonals < ActiveRecord::Migration
  def self.up
    change_table :personals do |t|
      t.attachment :foto
    end
  end

  def self.down
    remove_attachment :personals, :foto
  end
end
