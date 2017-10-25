class Sitio < ActiveRecord::Base
  has_many :fotos, dependent: :delete_all
  has_many :parrafos, dependent: :delete_all

  validates_presence_of :ref
  validates_presence_of :partial
  validates_presence_of :num_fotos
  validates_presence_of :num_parrafos
end
