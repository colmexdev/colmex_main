class Slider < ActiveRecord::Base

  has_attached_file :imagen, :styles => {},
                    :url => "/assets/slider/:basename_:style_:id.:extension",
                    :path => ":rails_root/public/assets/slider/:basename_:style_:id.:extension"

  validates_presence_of :liga
  validates_attachment_presence :imagen
  validates_attachment_content_type :imagen, :content_type => ['image/jpeg', 'image/png', 'image/jpg']
end
