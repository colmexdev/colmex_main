json.array!(@descubres) do |descubre|
  json.extract! descubre, :id, :titulo, :descripcion, :liga, :contenido
  json.url descubre_url(descubre, format: :json)
end
