class Curso < ActiveRecord::Base

  validates_presence_of :titulo
  validates_presence_of :descripcion
  validates_presence_of :programa
  validates_presence_of :traduccion_desc
  validates_presence_of :traduccion_tit
  validates_presence_of :tipo_curso, if: "programa == 'Curso'"
  validates_presence_of :tipo_curso_linea, if: "tipo_curso == \"En línea\""
end
