class Parrafo < ActiveRecord::Base
  belongs_to :sitio

  validates_presence_of :sitio_id
  validates_presence_of :index
end
