class Descubre < ActiveRecord::Base

  has_attached_file :imagen, :styles => {},
                    :url => "/assets/descubre/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/descubre/:id/:style/:basename.:extension",
                    :default_url => "/vacio.jpg"

  validates_presence_of :titulo
  validates_presence_of :liga
  validates_presence_of :contenido
  validates_presence_of :fecha_publicacion
  validates_presence_of :fecha_limite_pub

  validates_attachment_content_type :imagen, :content_type => ['image/jpeg', 'image/png', 'image/jpg']

end
