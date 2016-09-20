class Documento < ActiveRecord::Base

  has_attached_file :archivo,
                    :url => "/:tipo",
                    :path => ":rails_root/public/:tipo"

  validates_presence_of :nombre
  validates_presence_of :tipo
  validates_presence_of :anio, if: "tipo != 'Estatuto' or tipo != 'Transparencia'"
  validates_attachment_presence :archivo
  validates_attachment_content_type :archivo, :content_type => ['application/pdf']

  Paperclip.interpolates :tipo do |attachment, style|
    if attachment.instance.tipo != "Transparencia"
      "assets/pdfs/:basename_:id.:extension"
    else
      "bienes/:basename.:extension"
    end
  end
end
