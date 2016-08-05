class Curso < ActiveRecord::Base

  validates_presence_of :titulo
  validates_presence_of :descripcion
  validates_presence_of :programa
  validates_presence_of :traduccion_desc
  validates_presence_of :traduccion_tit
end
