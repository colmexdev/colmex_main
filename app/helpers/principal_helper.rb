module PrincipalHelper

  def construye_slider
    i = 0
    html_block = ""
    control_block = ""
    Slider.all.each do |im|
      control_block = control_block + '<li data-target="#myCarousel" data-slide-to="' + i.to_s + '"' + (i == 0 ?  'class="active"' : '') + '></li>'


      html_block = html_block + '<div class="item ' + (i == 0 ?  "active" : "") + '">'
      html_block = html_block + link_to(image_tag(im.imagen.url),im.liga)
      html_block = html_block + '</div>'
      i = i + 1
    end
    control_block = '<ol class="carousel-indicators">'+control_block+'</ol>'
    html_block = '<div class="carousel-inner" role="listbox">'+html_block+'</div>'
    return (control_block+html_block).html_safe
  end

  def construye_slider_eventos
    bloque_html = ""
    slides = (@resultado.each.length / 4).ceil
    if slides == 0
      slides = 1 
    end
    j = 0
    for i in 1..slides
      k = 1
      bloque_html = bloque_html + '<div class=' + (i==1 ? '"item active"' : '"item"') + '>' 
      while k % 5 != 0
        bloque_html = bloque_html + '<div class="evento">'
        if j < @resultado.each.length
          fila = @resultado.each[j]
          bloque_html = bloque_html + fila["tituloActividad"].to_s + "<br>"
          bloque_html = bloque_html + fila["centroOrganiza"].to_s + "<br>"
          bloque_html = bloque_html + fila["tipoActividad"].to_s + "<br>"
          bloque_html = bloque_html + fila["centroSiglas"].to_s + "<br>"
          bloque_html = bloque_html + fila["fechaInicio"].to_s + "<br>"
          bloque_html = bloque_html + fila["horaInicio"].to_s + "<br>"
          bloque_html = bloque_html + fila["fechaFin"].to_s + "<br>"
          bloque_html = bloque_html + fila["horaFin"].to_s + "<br><"
          bloque_html = bloque_html + fila["subtituloActividad"].to_s + "<br>"
          bloque_html = bloque_html + fila["sede"].to_s + "<br>"
          bloque_html = bloque_html + fila["institucionSede"].to_s + "<br>"
          bloque_html = bloque_html + fila["liga"].to_s + "<br>"
        end
        bloque_html = bloque_html + '</div>'
        k = k + 1
        j = j + 1
      end
      bloque_html = bloque_html + '</div>'
    end
  return bloque_html.html_safe
  end
end
