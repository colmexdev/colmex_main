class Personal < ActiveRecord::Base

  has_attached_file :foto, :styles => {},
                    :url => "/assets/emeritos/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/emeritos/:id/:style/:basename.:extension",
                    :default_url => "/vacio.png"

  validates_presence_of :nombre
  validates_presence_of :seccion
  validates :correo, presence: true, if: "seccion != 'Junta' and seccion != 'Asociado a proyecto' and seccion != 'Asociado a Centro' and seccion != 'Comision' and seccion != 'Consejo'"
  validates :telefono, presence: true, if: "seccion != 'Junta' and seccion != 'Asociado a proyecto' and seccion != 'Asociado a Centro' and seccion != 'Comision' and seccion != 'Consejo'"
  validates :extension, presence: true, if: "seccion != 'Junta' and seccion != 'Asociado a proyecto' and seccion != 'Asociado a Centro' and seccion != 'Comision' and seccion != 'Consejo'"
  validates_attachment_presence :foto, if:  "seccion == 'Centros'"
  validates :depto, presence: true, if: "seccion == 'Centros' or (seccion == 'Operativas' and cargo.blank?) or seccion == 'Consejo'"
  validates :cargo, presence: true, if: "(seccion == 'Operativas' and depto.blank? ) or seccion == 'Administración' or seccion == 'Presidencia' or  seccion != 'Asociado a proyecto' or seccion != 'Asociado a Centro' "
  validates :depto_eng, presence: true, if: "seccion == 'Centros' or (seccion == 'Operativas' and cargo.blank?) or seccion == 'Consejo'"
  validates :cargo_eng, presence: true, if: "(seccion == 'Operativas' and depto.blank? ) or seccion == 'Administración' or seccion == 'Presidencia' or seccion != 'Asociado a proyecto' or seccion != 'Asociado a Centro' "
 

  validates_attachment_content_type :foto, :content_type => ['image/jpeg', 'image/png', 'image/jpg']
end
