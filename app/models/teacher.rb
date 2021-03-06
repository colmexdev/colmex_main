class Teacher < ActiveRecord::Base
  
  has_attached_file :foto, :styles => {},
                    :url => "/assets/academicos/:style/:basename_:id.:extension",
                    :path => ":rails_root/public/assets/academicos/:style/:basename_:id.:extension",
                    :default_url => "/persona.jpg"

  validates_attachment_content_type :foto, :content_type => ['image/jpeg', 'image/png', 'image/jpg']
end
