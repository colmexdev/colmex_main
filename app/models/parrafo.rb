class Parrafo < ActiveRecord::Base
  validates_presence_of :sitio_id
  validates_presence_of :texto
  validates_presence_of :index
end
