json.array!(@sliders) do |slider|
  json.extract! slider, :id, :liga
  json.url slider_url(slider, format: :json)
end
