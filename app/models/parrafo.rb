class Parrafo < ActiveRecord::Base
  validates_presence_of :ref
  validates_presence_of :texto
  validates_presence_of :index
end
