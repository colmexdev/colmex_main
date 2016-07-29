module PrincipalHelper

  def construye_slider(sliders)
    i = 0
    html_block = ""
    control_block = ""
    sliders.each do |im|
      control_block = control_block + '<li data-target="#myCarousel" data-slide-to="' + i.to_s + '"' + (i == 0 ?  'class="active"' : '') + '></li>'
      html_block = html_block + '<div class="item ' + (i == 0 ?  "active" : "") + '">'
      html_block = html_block + image_tag(im.imagen.url, :class => "imagen_slider_fondo") + link_to(image_tag(im.badge.url, {:class => "imagen_slider_sobre", :style => "top:" + im.pos_x.to_s + "%; left:" + im.pos_y.to_s + "%;"}),im.liga, :class => "liga_img")
      html_block = html_block + '</div>'
      i = i + 1
    end
    control_block = '<ol class="carousel-indicators">'+control_block+'</ol>'
    html_block = '<div class="carousel-inner" role="listbox">'+html_block+'</div>'
    return (control_block+html_block).html_safe
  end

  def construye_slider_eventos(sliders)
    bloque_html, bloque_opt_html, bloque_tiny_html = "", "", ""
    slides = (sliders.each.length / 4).ceil
    if slides == 0
      slides = 1 
    end
    j = 0
    primer_item = true;
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
        bloque_tiny_html = bloque_tiny_html + '<div class=' + (primer_item ? '"item active"' : '"item"') + '><div class="evento">'
        primer_item = false;
        if j < sliders.each.length
          fila = sliders.each[j]
          if k == 1
            fila["fechaFin"] = "26/06/2016"
            fila["centroSiglas"] = "CEDUA"
            fila["subtituloActividad"] = "Una cadena larga para poder cortarla si es necesario"
          end
          bloque_html = bloque_html + construirEvento(fila)
          bloque_opt_html = bloque_opt_html + construirEvento(fila)
          bloque_tiny_html = bloque_tiny_html + construirEvento(fila, true)
        end
        bloque_html = bloque_html + '</div>'
        bloque_opt_html = bloque_opt_html + '</div>'
        bloque_tiny_html = bloque_tiny_html + '</div></div>'
        k = k + 1
        j = j + 1
      end
      bloque_html = bloque_html + '</div>'
      bloque_opt_html = bloque_opt_html + '</div>'
    end
    return bloque_html, bloque_opt_html, bloque_tiny_html
  end

  def construirEvento(fila, chico = false)
    centros = ['ceaa', 'cedua', 'cee', 'ceh', 'cei', 'cell', 'ces', 'colmex', 'bdcv']
    bloque_html = '<div class="img_evento">'
    bloque_html = bloque_html + ( centros.include?(fila["centroSiglas"].downcase) ? ActionController::Base.helpers.image_tag(fila["centroSiglas"].downcase + ".png", :class => "img_sede") : '') + "</div>"

    bloque_html = bloque_html + '<div class="desc_evento">'

    bloque_html = bloque_html + '<div class="tipo_evento"><p>' + fila["tipoActividad"].to_s + "</p></div>"
    bloque_html = bloque_html + '<div class="titulo_evento"><p>' + fila["tituloActividad"].to_s + (fila["subtituloActividad"].to_s != "" ? (": " + fila["subtituloActividad"].to_s) : "") + "</p></div>"

    bloque_html = bloque_html + '<div class="lugar_fecha_evento">'
    bloque_html = bloque_html + '<div class="cal">' + ActionController::Base.helpers.image_tag("calendario.png", :class => "img_cal") + '</div>'
    bloque_html = bloque_html + '<div class="datos_evento"><p>'
    bloque_html = bloque_html + arregloFecha(fila["fechaInicio"], fila["fechaFin"], chico) + "<br>"
    bloque_html = bloque_html + l(Time.parse(fila["horaInicio"]), format: "%H:%M") + " | " + l(Time.parse(fila["horaFin"]), format: "%H:%M") + "<br>"
    bloque_html = bloque_html + fila["sede"].to_s + ', 
<br><span>' + fila["institucionSede"].to_s + "</span></p></div></div>"

    bloque_html = bloque_html + '<div class="liga_evento"><a href="'+fila["liga"].to_s+'" class="liga_evento">' + t('eventos.liga') + ' +' + '</a></div>'

    bloque_html = bloque_html + "</div>"
    return bloque_html
  end

  def arregloFecha(fechaI, fechaF, chico)
    diferencia = Date.strptime(fechaI,"%d/%m/%Y") - Date.strptime(fechaF,"%d/%m/%Y")
    if diferencia == 0
      return l(Date.strptime(fechaI,"%d/%m/%Y"), format: :long)
    else
      return l(Date.strptime(fechaI,"%d/%m/%Y"), format: (chico ? :short : :long)) + "<br>" + l(Date.strptime(fechaF,"%d/%m/%Y"), format: (chico ? :short : :long))
    end
  end

  def construir_link(imagen, imagen_hover, texto, liga, clase)
    return ('<a href="' + raw(liga) + '" class="' + raw(clase) + '">' + ActionController::Base.helpers.image_tag(imagen, :class => "leave_img") + ActionController::Base.helpers.image_tag(imagen_hover, :class => "hover_img") + raw(texto) + "</a>").html_safe
  end

  def construir_encabezado(imagen, imagen_hover, texto)
    return (ActionController::Base.helpers.image_tag(imagen, :class => "leave_img") + ActionController::Base.helpers.image_tag(imagen_hover, :class => "hover_img") + raw(texto) ).html_safe
  end

  def construir_descubre(descubres)
    bloque_html = ""
    descubres.each do |d|
      bloque_html = bloque_html + "<div class=\"frame-descubre\">"
      if d.imagen.url != "/vacio.jpg"
        bloque_html = bloque_html + ActionController::Base.helpers.image_tag(d.imagen, :class => "imagen-descubre")
      else
        bloque_html = bloque_html + "<span class=\"cont-descubre-pre\">" + d.contenido + "</span><br />"
        bloque_html = bloque_html + "<span class=\"titulo-descubre-pre\">" + d.titulo + "</span>"
      end
      bloque_html = bloque_html + "<a href=\""+ d.liga + "\" " + (d.contenido.downcase == "video" ? ("data-uk-lightbox title=\"\"") : "target=\"_blank\"" ) + "><div class=\"frame-hover\">"
      bloque_html = bloque_html + "<span class=\"cont-descubre\">" + d.contenido + "</span><br />"
      bloque_html = bloque_html + "<span class=\"titulo-descubre\">" + d.titulo + "</span>"
      bloque_html = bloque_html + ActionController::Base.helpers.image_tag(Content.where(tipo: d.contenido).first.icono.url, :class => "icono-descubre")
      bloque_html = bloque_html + "</div></a></div>"
    end
    return bloque_html.html_safe
  end

end
