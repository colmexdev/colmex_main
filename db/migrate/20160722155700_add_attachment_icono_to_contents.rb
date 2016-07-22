class AddAttachmentIconoToContents < ActiveRecord::Migration
  def self.up
    change_table :contents do |t|
      t.attachment :icono
    end
  end

  def self.down
    remove_attachment :contents, :icono
  end
end
