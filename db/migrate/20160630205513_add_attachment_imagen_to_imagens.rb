class AddAttachmentImagenToImagens < ActiveRecord::Migration
  def self.up
    change_table :imagens do |t|
      t.attachment :imagen
    end
  end

  def self.down
    remove_attachment :imagens, :imagen
  end
end
