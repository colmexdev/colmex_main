json.array!(@catedras) do |catedra|
  json.extract! catedra, :id, :titulo, :descripcion, :liga, :tipo
  json.url catedra_url(catedra, format: :json)
end
