class Emerito < ActiveRecord::Base

  has_attached_file :foto, :styles => {},
                    :url => "/assets/emeritos/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/emeritos/:id/:style/:basename.:extension",
                    :default_url => "/vacio.png"

  validates_presence_of :nombre
  validates_presence_of :fecha_anexion
  validates_presence_of :centro
  validates_attachment_content_type :foto, :content_type => ['image/jpeg', 'image/png', 'image/jpg']
end
