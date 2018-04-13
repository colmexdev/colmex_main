class Content < ActiveRecord::Base

    has_attached_file :icono, :styles => {:small => "20x20"},
                    :url => "/assets/contenidos/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/contenidos/:id/:style/:basename.:extension",
                    :default_url => '/link.png';

  validates_presence_of :tipo
  validates_presence_of :tipo_eng
  validates_presence_of :plural
  validates_presence_of :plural_eng
  validates_attachment_content_type :icono, :content_type => ['image/jpeg', 'image/png', 'image/jpg']
end
