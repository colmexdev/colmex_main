class Foto < ActiveRecord::Base
  has_attached_file :foto, :styles => {},
                    :url => "/assets/fotos/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/fotos/:id/:style/:basename.:extension",
                    :default_url => "/vacio.png"

  validates_presence_of :sitio_index
  validates_presence_of :index
  validates_attachment_content_type :foto, :content_type => ['image/jpeg', 'image/png', 'image/jpg']
end
