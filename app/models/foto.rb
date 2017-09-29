class Foto < ActiveRecord::Base
  belongs_to :sitio

  has_attached_file :foto, :styles => {},
                    :url => "/assets/fotos/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/fotos/:id/:style/:basename.:extension",
                    :default_url => "/vacio.png"

  validates_presence_of :sitio_id
  validates_presence_of :f_ind
  validates_attachment_content_type :foto, :content_type => ['image/jpeg', 'image/png', 'image/jpg']
end
