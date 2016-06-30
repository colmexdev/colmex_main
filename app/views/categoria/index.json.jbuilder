json.array!(@categoria) do |categorium|
  json.extract! categorium, :id, :nombre
  json.url categorium_url(categorium, format: :json)
end
