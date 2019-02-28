class Beneficiary < ActiveRecord::Base

  validates_presence_of :nombre
  validates_presence_of :proyecto
  validates_presence_of :centro
  validates_presence_of :index

  has_attached_file :foto, :styles => {},
                    :url => "/assets/postdocs/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/postdocs/:id/:style/:basename.:extension",
                    :default_url => "/persona.jpg"
  validates_attachment_content_type :foto, :content_type => ['image/jpeg', 'image/png', 'image/jpg']
end
