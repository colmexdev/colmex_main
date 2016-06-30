class Emerito < ActiveRecord::Base

  has_attached_file :foto, :styles => {},
                    :url => "/assets/emeritos/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/emeritos/:id/:style/:basename.:extension"

  validates_attachment_content_type :foto, :content_type => ['image/jpeg', 'image/png', 'image/jpg']
end
