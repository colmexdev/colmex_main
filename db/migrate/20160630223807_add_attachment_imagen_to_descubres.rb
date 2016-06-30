class AddAttachmentImagenToDescubres < ActiveRecord::Migration
  def self.up
    change_table :descubres do |t|
      t.attachment :imagen
    end
  end

  def self.down
    remove_attachment :descubres, :imagen
  end
end
