class AddAttachmentFotoToEmeritos < ActiveRecord::Migration
  def self.up
    change_table :emeritos do |t|
      t.attachment :foto
    end
  end

  def self.down
    remove_attachment :emeritos, :foto
  end
end
