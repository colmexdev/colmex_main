class Personal < ActiveRecord::Base

  has_attached_file :foto, :styles => {},
                    :url => "/assets/emeritos/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/emeritos/:id/:style/:basename.:extension",
                    :default_url => "/vacio.png"

  validates_presence_of :nombre
  validates_presence_of :seccion
  validates :correo, presence: true, if: "seccion != 'Junta'"
  validates :telefono, presence: true, if: "seccion != 'Junta'"
  validates :extension, presence: true, if: "seccion != 'Junta'"
  validates_attachment_presence :foto, if:  "seccion == 'Centros'"
  validates :depto, presence: true, if: "seccion == 'Centros' or (seccion == 'Operativas' and cargo.blank?)"
  validates :cargo, presence: true, if: "(seccion == 'Operativas' and depto.blank? ) or seccion == 'Administración' or seccion == 'Presidencia'"
 

  validates_attachment_content_type :foto, :content_type => ['image/jpeg', 'image/png', 'image/jpg']
end
