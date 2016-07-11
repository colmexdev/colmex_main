module PrincipalHelper

  def construye_slider
    i = 0
    html_block = ""
    control_block = ""
    Slider.all.each do |im|
      control_block = control_block + '<li data-target="#myCarousel" data-slide-to="' + i.to_s + '"' + (i == 0 ?  'class="active"' : '') + '></li>'


      html_block = html_block + '<div class="item ' + (i == 0 ?  "active" : "") + '">'
      html_block = html_block + link_to(image_tag(im.imagen.url, :class => "imagen_slider_fondo") + image_tag("colmex-principal.png", :class => "imagen_slider_sobre"),im.liga, :class => "liga_img")
      html_block = html_block + '</div>'
      i = i + 1
    end
    control_block = '<ol class="carousel-indicators">'+control_block+'</ol>'
    html_block = '<div class="carousel-inner" role="listbox">'+html_block+'</div>'
    return (control_block+html_block).html_safe
  end

  def construye_slider_eventos
    bloque_html, bloque_opt_html = "", ""
    slides = (@resultado.each.length / 4).ceil
    if slides == 0
      slides = 1 
    end
    j = 0
    for i in 1..slides
      k = 1
      bloque_html = bloque_html + '<div class=' + (i==1 ? '"item active"' : '"item"') + '>' 
			bloque_opt_html = bloque_opt_html + '<div class=' + (i==1 ? '"item active"' : '"item"') + '>'
      while k % 5 != 0
        bloque_html = bloque_html + '<div class="evento">'
				if k % 3 == 0
					bloque_opt_html = bloque_opt_html + '</div><div class="item">'
				end
				bloque_opt_html = bloque_opt_html + '<div class="evento">'
        if j < @resultado.each.length
          fila = @resultado.each[j]
          if k == 1
            fila["fechaFin"] = "26/06/2016"
            fila["centroSiglas"] = "CEDUA"
          end
          bloque_html = bloque_html + construirEvento(fila)
					bloque_opt_html = bloque_opt_html + construirEvento(fila)
        end
        bloque_html = bloque_html + '</div>'
				bloque_opt_html = bloque_opt_html + '</div>'
        k = k + 1
        j = j + 1
      end
      bloque_html = bloque_html + '</div>'
			bloque_opt_html = bloque_opt_html + '</div>'
    end
    return bloque_html, bloque_opt_html
  end

  def construirEvento(fila)
    bloque_html = '<div class="img_evento">'
    bloque_html = bloque_html + ActionController::Base.helpers.image_tag(fila["centroSiglas"].downcase + ".png", :class => "img_sede") + "</div>"

    bloque_html = bloque_html + '<div class="desc_evento">'

    bloque_html = bloque_html + '<div class="tipo_evento"><p>' + fila["tipoActividad"].to_s + "<p></div>"
    bloque_html = bloque_html + '<div class="titulo_evento">' + fila["tituloActividad"].to_s + (fila["subtituloActividad"].to_s != nil ? (": " + fila["subtituloActividad"].to_s) : "") + "</div>"

    bloque_html = bloque_html + '<div class="lugar_fecha_evento">'
    bloque_html = bloque_html + '<div class="cal">' +  '</div>'
    bloque_html = bloque_html + '<div class="datos_evento">'
    bloque_html = bloque_html + arregloFecha(fila["fechaInicio"], fila["fechaFin"]) + "<br>"
    bloque_html = bloque_html + l(Time.parse(fila["horaInicio"]), format: "%H:%M") + " | " + l(Time.parse(fila["horaFin"]), format: "%H:%M") + "<br>"
    bloque_html = bloque_html + fila["sede"].to_s + ", " + fila["institucionSede"].to_s + "</div></div>"

    bloque_html = bloque_html + '<div class="liga_evento"><a href="'+fila["liga"].to_s+'" class="liga_evento">'+t('eventos.liga')+'</a></div>'

    bloque_html = bloque_html + "</div>"
    return bloque_html
  end

  def arregloFecha(fechaI, fechaF)
    diferencia = Date.strptime(fechaI,"%d/%m/%Y") - Date.strptime(fechaF,"%d/%m/%Y")
    if diferencia == 0
      return l(Date.strptime(fechaI,"%d/%m/%Y"), format: :long)
    else
      return l(Date.strptime(fechaI,"%d/%m/%Y"), format: :long) + "<br>" + l(Date.strptime(fechaF,"%d/%m/%Y"), format: :long)
    end
  end
end
