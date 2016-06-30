json.array!(@contents) do |content|
  json.extract! content, :id, :tipo
  json.url content_url(content, format: :json)
end
