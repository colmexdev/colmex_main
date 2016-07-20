json.array!(@premiados) do |premiado|
  json.extract! premiado, :id, :nombre, :descripcion, :tipo
  json.url premiado_url(premiado, format: :json)
end
