class Convocatoriap < ActiveRecord::Base

  has_attached_file :imagen, :styles => {},
                    :url => "/assets/becasp/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/becasp/:id/:style/:basename.:extension",
                    :default_url => "/vacio.png"

  validates_attachment_presence :imagen
  validates_attachment_content_type :imagen, :content_type => ['image/jpeg', 'image/png', 'image/jpg']

  has_attached_file :documento,
                    :url => "/assets/docs_becas/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/docs_becas/:id/:style/:basename.:extension"

  validates_attachment_content_type :documento, :content_type => ['application/pdf']

  validates_presence_of :titulo
end
