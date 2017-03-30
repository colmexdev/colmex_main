class AddAttachmentBadgeEngToSliders < ActiveRecord::Migration
  def self.up
    change_table :sliders do |t|
      t.attachment :badge_eng
    end
  end

  def self.down
    remove_attachment :sliders, :badge_eng
  end
end
