class AddAttachmentBadgeToSliders < ActiveRecord::Migration
  def self.up
    change_table :sliders do |t|
      t.attachment :badge
    end
  end

  def self.down
    remove_attachment :sliders, :badge
  end
end
