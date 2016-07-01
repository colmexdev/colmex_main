class AddAttachmentImagenToSliders < ActiveRecord::Migration
  def self.up
    change_table :sliders do |t|
      t.attachment :imagen
    end
  end

  def self.down
    remove_attachment :sliders, :imagen
  end
end
