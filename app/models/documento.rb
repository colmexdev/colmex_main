class Documento < ActiveRecord::Base

  has_attached_file :archivo,
                    :url => "/assets/pdfs/:basename_:id.:extension",
                    :path => ":rails_root/public/assets/pdfs/:basename_:id.:extension"

  validates_presence_of :nombre
  validates_presence_of :tipo
  validates_presence_of :anio
  validates_attachment_presence :archivo
  validates_attachment_content_type :archivo, :content_type => ['application/pdf']
end
