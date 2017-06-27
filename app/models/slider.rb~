class Slider < ActiveRecord::Base

  has_attached_file :imagen, :styles => {},
                    :url => "/assets/slider/:basename_:style_:id.:extension",
                    :path => ":rails_root/public/assets/slider/:basename_:style_:id.:extension"

  has_attached_file :badge, :styles => {},
                    :url => "/assets/slider/:basename_:style_:id.:extension",
                    :path => ":rails_root/public/assets/slider/:basename_:style_:id.:extension"

  has_attached_file :badge_eng, :styles => {},
                    :url => "/assets/slider/:basename_:style_:id.:extension",
                    :path => ":rails_root/public/assets/slider/:basename_:style_:id.:extension"

  validates_presence_of :posicion
  validates_presence_of :fecha_expiracion
  validates_attachment_presence :imagen
  validates_attachment_content_type :imagen, :content_type => ['image/jpeg', 'image/png', 'image/jpg']
  validates_attachment_presence :badge
  validates_attachment_content_type :badge, :content_type => ['image/jpeg', 'image/png', 'image/jpg']
  validates_attachment_presence :badge_eng
  validates_attachment_content_type :badge_eng, :content_type => ['image/jpeg', 'image/png', 'image/jpg']
end
