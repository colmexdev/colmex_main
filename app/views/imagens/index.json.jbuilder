json.array!(@imagens) do |imagen|
  json.extract! imagen, :id, :texto_pie, :galeria, :categoria_premio
  json.url imagen_url(imagen, format: :json)
end
