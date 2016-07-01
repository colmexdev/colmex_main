json.array!(@cursos) do |curso|
  json.extract! curso, :id, :titulo, :descripcion, :fecha_inicio_conv, :fecha_fin_conv, :fecha_inicio_clases, :liga, :tipo_curso
  json.url curso_url(curso, format: :json)
end
