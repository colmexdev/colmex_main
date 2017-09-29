class Sitio < ActiveRecord::Base
  has_many :fotos, dependent: :destroy
  has_many :parrafos, dependent: :destroy

  validates_presence_of :ref
  validates_presence_of :partial
  validates_presence_of :num_fotos
  validates_presence_of :num_parrafos
end
