json.array!(@frases) do |frase|
  json.extract! frase, :id, :cita, :autor
  json.url frase_url(frase, format: :json)
end
