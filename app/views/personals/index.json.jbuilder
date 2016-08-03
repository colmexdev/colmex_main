json.array!(@personals) do |personal|
  json.extract! personal, :id, :nombre, :seccion, :correo, :telefono, :extension, :cargo, :depto
  json.url personal_url(personal, format: :json)
end
