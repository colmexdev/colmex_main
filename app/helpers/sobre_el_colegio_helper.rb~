module SobreElColegioHelper

  def construye_cursos(tipo_programa)
    bloque_html, i = "", 1
    Curso.where(programa: tipo_programa).each do |p|
      bloque_html = bloque_html + "<p>" + i.to_s + ".- " + (params[:locale] == "sp" ? p.titulo : p.traduccion_tit) + ". " + (params[:locale] == "sp" ? p.descripcion : p.traduccion_desc) + "</p>"
      i = i + 1
    end
    return bloque_html.html_safe
  end
end
