json.array!(@emeritos) do |emerito|
  json.extract! emerito, :id, :nombre, :fecha_anexion, :centro, :semblanza
  json.url emerito_url(emerito, format: :json)
end
