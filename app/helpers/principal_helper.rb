module PrincipalHelper

  def construye_slider(sliders)
    i = 0
    html_block = ""
    control_block = ""
    sliders.each do |im|
      control_block = control_block + '<li data-target="#myCarousel" data-slide-to="' + i.to_s + '"' + (i == 0 ?  'class="active"' : '') + '></li>'
      html_block = html_block + '<div class="item ' + (i == 0 ?  "active" : "") + '">' + (im.liga.to_s.include?("youtu") ? ("<script type=\"text/javascript\" src=\"../js/lightbox.js\"></script><a href=\"" + im.liga.to_s + "\" data-uk-lightbox data-lightbox-type=\"video\">") : "")
      html_block = html_block + image_tag(im.imagen.url, :class => "imagen_slider_fondo") + "<div class=\"ghost-slider\">" + (im.liga.to_s != "" ? ( im.liga.to_s.include?("youtu") ? ("<a href=\"" + im.liga.to_s + "\" data-uk-lightbox data-lightbox-type=\"video\">" + image_tag(im.badge.url, {:class => "imagen_slider_sobre " + im.posicion.mb_chars.downcase, :id => "badge-" + i.to_s}) + "</a>") : link_to(image_tag(im.badge.url, {:class => "imagen_slider_sobre " + im.posicion.mb_chars.downcase, :id => "badge-" + i.to_s}),im.liga, :class => "liga_img", :target => ((im.liga.to_s.include?("agenda") || im.liga.to_s.include?("libros")) ? "_blank" : "" ))) : image_tag(im.badge.url, {:class => "imagen_slider_sobre " + im.posicion.mb_chars.downcase, :id => "badge-" + i.to_s}) ) + "</div>"
      html_block = html_block + '</div>' + (im.liga.to_s.include?("youtu") ? "</a>" : "")
      i = i + 1
    end
    control_block = '<ol class="carousel-indicators">'+control_block+'</ol>'
    html_block = '<div class="carousel-inner" role="listbox">'+html_block+'</div>'
    return (control_block+html_block).html_safe
  end

  def construye_slider_eventos(sliders)
    bloque_html, bloque_opt_html, bloque_tiny_html = "", "", ""
    if sliders == 0
      return bloque_html, bloque_opt_html, bloque_tiny_html
    end
    slides = (sliders.each.length / 4).ceil
    if slides == 0
      slides = 1 
    end
    j = 0
    primer_item = true;
    for i in 1..slides
      k = 1
			if j >= sliders.each.length
				break
			end
      bloque_html = bloque_html + '<div class=' + (i==1 ? '"item active"' : '"item"') + '>' 
      bloque_opt_html = bloque_opt_html + '<div class=' + (i==1 ? '"item active"' : '"item"') + '>'
      while k % 5 != 0
				if j >= sliders.each.length
					break
				end
        bloque_html = bloque_html + '<div class="evento">'
        if k % 3 == 0
          bloque_opt_html = bloque_opt_html + '</div><div class="item">'
        end
        bloque_opt_html = bloque_opt_html + '<div class="evento">'
        bloque_tiny_html = bloque_tiny_html + '<div class=' + (primer_item ? '"item active"' : '"item"') + '><div class="evento">'
        primer_item = false;
        if j < sliders.each.length
          fila = sliders.each[j]
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
    centros = ['ceaa', 'cedua', 'cee', 'ceh', 'cei', 'cell', 'ces', 'colmex', 'bdcv', 'piem']
    bloque_html = '<div class="img_evento">'
    bloque_html = bloque_html + ( centros.include?(fila["centroSiglas"].mb_chars.downcase) ? ActionController::Base.helpers.image_tag(fila["centroSiglas"].mb_chars.downcase + ".png", :class => "img_sede") : '') + "</div>"

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

    bloque_html = bloque_html + '<div class="liga_evento"><a href="'+fila["liga"].to_s+'" class="liga_evento" target="_blank">' + t('eventos.liga') + ' +' + '</a></div>'

    bloque_html = bloque_html + "</div>"
    return bloque_html
  end

  def arregloFecha(fechaI, fechaF, chico)
    diferencia = Date.strptime(fechaI,"%d/%m/%Y") - Date.strptime(fechaF,"%d/%m/%Y")
    if diferencia == 0
      return l(Date.strptime(fechaI,"%d/%m/%Y"), format: (chico ? :short : :long))
    else
      return l(Date.strptime(fechaI,"%d/%m/%Y"), format: (chico ? :short : :long)) + "<br>" + l(Date.strptime(fechaF,"%d/%m/%Y"), format: (chico ? :short : :long))
    end
  end

  def construir_link(imagen, imagen_hover, texto, liga, clase, externa = true)
    return ('<a ' + (externa ? 'target="_blank"' : '' ) + 'href="' + raw(liga) + '" class="' + raw(clase) + '">' + ActionController::Base.helpers.image_tag(imagen, :class => "leave_img") + ActionController::Base.helpers.image_tag(imagen_hover, :class => "hover_img") + raw(texto) + "</a>").html_safe
  end

  def construir_encabezado(imagen, imagen_hover, texto)

    return (ActionController::Base.helpers.image_tag(imagen, :class => "leave_img") + ActionController::Base.helpers.image_tag(imagen_hover, :class => "hover_img") + raw(texto) ).html_safe
  end

  def construir_descubre(descubres)
    bloque_html = ""
    i = 0;
    descubres.each do |d|
      bloque_html = bloque_html + "<div class=\"frame-descubre animate\" id=\"frame-" + i.to_s + "\">"
      if d.imagen.url != "/vacio.jpg"
        bloque_html = bloque_html + ActionController::Base.helpers.image_tag(d.imagen, :class => "imagen-descubre")
      else
        bloque_html = bloque_html + "<p><span class=\"cont-descubre\">" + d.contenido.mb_chars.upcase + "</span></p>"
        bloque_html = bloque_html + "<p><span class=\"titulo-descubre\">" + d.titulo + "</span></p>"
      end
bloque_html = bloque_html + "<a href=\"" + d.liga + "\" " + (d.contenido.mb_chars.downcase == "video" ? ("data-uk-lightbox data-lightbox-type=\"iframe\"") : "target=\"_blank\"" ) + "><div class=\"frame-hover\" id=\"frame-" + i.to_s + "-hov\">"
      bloque_html = bloque_html + "<p><span class=\"cont-descubre\">" + d.contenido.mb_chars.upcase + "</span></p>"
      bloque_html = bloque_html + "<p><span class=\"titulo-descubre\" id=\"tit-desc-" + i.to_s + "\">" + d.titulo + "</span></p>"
      bloque_html = bloque_html + ActionController::Base.helpers.image_tag(Content.where(tipo: d.contenido).first.icono.url, :class => "icono-descubre")
      bloque_html = bloque_html + "</div></a></div>"
      i = i + 1
    end
    return bloque_html.html_safe
  end

  def convierteCentros(siglas)
    centros = ["Centro de Estudios de Asia y África", "Centro de Estudios Demográficos, Urbanos y Ambientales", "Centro de Estudios Económicos", "Centro de Estudios Históricos", "Centro de Estudios Internacionales", "Centro de Estudios Lingüísticos y Literarios", "Centro de Estudios Sociológicos"]
    sigla = ["CEAA", "CEDUA", "CEE", "CEH", "CEI", "CELL", "CES"]
    return centros[sigla.index(siglas)]
  end

  def num2Month(mes_num)
    meses = ["enero", "febrero", "marzo", "abril", "mayo", "junio", "julio", "agosto", "septiembre", "octubre", "noviembre", "diciembre"]
    return meses[mes_num]
  end

  def pluralizar(categoria)
    cad_plural = {"Artículo de investigación" => "Artículos de investigación", "Curso" => "Cursos", "Video" => "Videos", "Convocatoria" => "Convocatorias", "Premio" => "Premios", "Artículo de opinión" => "Artículos de opinión", "Novedad editorial" => "Novedades editoriales", "Proyecto de investigación" => "Proyectos de investigación", "Anuncio" => "Anuncios", "Podcast" => "Podcasts", "iTunes U" => "iTunes U"}
    return cad_plural[categoria]
  end

  def quitarEspeciales(cad)
    return cad.gsub(/[íïîì]/,"i").gsub(/[ÍÏÎÌ]/,"I").gsub(/[áäâà]/,"a").gsub(/[ÁÄÂÀ]/,"A").gsub(/[éëêè]/,"e").gsub(/[ÉËÊÈ]/,"E").gsub(/[óöôò]/,"o").gsub(/[ÓÖÔÒ]/,"O").gsub(/[úüûù]/,"u").gsub(/[ÚÜÛÙ]/,"U")
  end

  def construir_docentes(docs)
		bloque_html, i = "", 0
		docs.each do |d|
			acad = Academico.where("nombre = ?", d["nombre"]).first
      bloque_html = bloque_html + "<h3 class=\"uk-accordion-title\" id=\"doc-" + i.to_s + "\">" +  raw(construir_encabezado("bt-flechita.png", "bt-flechita-abajo.png", d["nombre"])) + "</h3>"
      bloque_html = bloque_html + "<div id=\"cont-" + i.to_s + "\" class=\"uk-accordion-content\">"


			bloque_html = bloque_html + "<div class=\"uk-grid uk-grid-medium uk-margin-large-bottom\">"

      bloque_html = bloque_html + "<div class=\"uk-width-large-1-6 uk-width-medium-1-5 uk-width-small-1-5 uk-text-center\">"
      bloque_html = bloque_html + "<img src=" + image_url(acad.foto.url) + " class=\"uk-border-rounded\" alt=\"Foto Académico\">"
			
      bloque_html = bloque_html + "</div>"

      bloque_html = bloque_html + "<div class=\"uk-width-large-5-6 uk-width-medium-4-5 uk-width-small-4-5 uk-text-left uk-text-break\">"
    	bloque_html = bloque_html + "<h3 class=\"vino\">" + d["nombre"] + "</h3>"
      bloque_html = bloque_html + "<h4 class=\"vino\">" + d["correo"] + "</h3>"
    	bloque_html = bloque_html + "<h4>" +" Centro de Estudios " + (d["adscripcion"].include?("Asia") ? "de " + d["adscripcion"] : (d["adscripcion"].include?("Lingüistico") ? "Lingüísticos y Literarios" : d["adscripcion"])) + "</h4>"
			bloque_html = bloque_html + "<h5>" + "Temas de investigación: " + d[:libres].join(", ") + "</h5>"
      bloque_html = bloque_html + "<h5>" + "Líneas de investigación: "

      d[:conts].each_with_index do |c, ind|
        bloque_html = bloque_html + "<span class=\"uk-link\" onclick=\"filtrarDirectorio(this)\">" + c + "</span>" + (ind < (d[:conts].size - 1) ? ", " : "") 
      end 

			bloque_html = bloque_html + "</h5>"

      bloque_html = bloque_html + "</div>"
      bloque_html = bloque_html + "</div>"
			

			bloque_html = bloque_html + "</div>"
      i = i + 1
    end
    return bloque_html.html_safe
  end

	def llenarLineas(dir)
		profes = []
		arch = File.open(dir,'r')
		i = 0
		#j = 0
		arch.each do |l|
		  i = i + 1
		  if i == 1
		    next
		  else
		    profs = l.scan(/[<]record[>].*?[<]\/record[>]/)
		    profs.each do |p|
		      arr_libres, arr_conts = [], [].to_set
		      nombre = p.match(/[<]datafield tag="100"(.)*?[>][<]subfield code="a"[>](.)*?[<]\/subfield[>](.)*?[<]\/datafield[>]/).to_s.split("</subfield>")[0].split("<subfield code=\"a\">")[1].split(", ")
		      nom = '%' + nombre[1].split(/[ ]+/).join("%") + "%" + nombre[0].split(/[ ]+/).join("%") + "%"
		      controladas = p.scan(/<datafield tag="372" ind1=" " ind2=" ">(.*?)<\/datafield>/)
		      controladas.each do |co|
		        year_lab =  co[0].scan(/[<]subfield code="s"[>](.+?)[<]\/subfield[>]/)
		        begin
		          co[0].scan(/[<]subfield code="a"[>](.+?)[<]\/subfield[>]/)[0][0].split(" -- ").each do |c|
		            arr_conts << c
		          end
		        rescue
		          #nada
		        end
		      end
		      libres = p.scan(/[<]datafield tag="972" ind1=" " ind2=" "[>](.*?)[<]\/datafield[>]/)
		      libres.each do |li|
		        arr_libres << li[0].scan(/[<]subfield code="a"[>].*?[<]\/subfield[>]/)[0].split("</subfield>")[0].split("<subfield code=\"a\">")[1]
		      end
		      begin
		        academico = Academico.where("nombre like ?",nom).first.as_json
						cont = ActiveDirectory::User.find(:first, :cn => quitarEspeciales(d["nombre"])).as_json
		        academico.store(:libres,arr_libres)
		        academico.store(:conts, arr_conts.to_a)
						academico.store(:mail, cont["entry"]["myhash"]["mail"])
            academico.store(:ext, cont["entry"]["myhash"]["telephonenumber"])
		        profes << academico
		        #j = j + 1
		      rescue
		        #puts "No se encontró: " + nom
		      end
		    end
		  end
		end
		#puts j
		arch.close
		return profes
	end

end
