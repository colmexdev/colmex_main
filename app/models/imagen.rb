class Imagen < ActiveRecord::Base

  has_attached_file :imagen, :styles => {},
                    :url => "/assets/galeria/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/galeria/:id/:style/:basename.:extension"

  validates_attachment_content_type :imagen, :content_type => ['image/jpeg', 'image/png', 'image/jpg']

end
