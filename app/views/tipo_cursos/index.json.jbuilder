json.array!(@tipo_cursos) do |tipo_curso|
  json.extract! tipo_curso, :id, :tipo
  json.url tipo_curso_url(tipo_curso, format: :json)
end
