json.array!(@academicos) do |academico|
  json.extract! academico, :id, :nombre, :adscripcion, :lineas_investigacion, :correo, :pagina
  json.url academico_url(academico, format: :json)
end
