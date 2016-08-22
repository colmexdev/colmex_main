class Premiado < ActiveRecord::Base
  validates_presence_of :nombre
  validates_presence_of :descripcion
  validates_presence_of :tipo, if: "tipo_premio == 'Comunidad'"
  validates_presence_of :tipo_premio
end
