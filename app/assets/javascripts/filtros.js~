function filtrarDescubres(){
	descubresPorTags.filterAll();
	descubresPorContenido.filterAll();
	var contAFiltrar = $("#contenido").val();
	var tagsAFiltrar = $("#tags").val();
	var descubresFiltradosPorContenido = descubresPorContenido.filter(function(d){ return ( contAFiltrar == "" ? true : d == contAFiltrar )}).top(Infinity);
	var descubresFiltradosPorTags = descubresPorTags.filter(function(d){ return (tagsAFiltrar == "" ? true : limpiarPuntuacion(d).indexOf(tagsAFiltrar) != -1)}).top(Infinity);
	actualizarVisibleDescubres(descubresFiltradosPorTags);
	//var bloqueHTML = construirDescubre(descubresFiltradosPorTags);
	//$("#wrapper").html(bloqueHTML);
	$("#wrapper").css({"height" : "auto", "margin-bottom" : "45px" });
	$("#cutter-descubre").css("display","none");
  var cw = $('.frame-descubre').width();
	$('.frame-descubre').css({'height':cw+'px'});
}

function actualizarVisibleDescubres(visibles){
	for(var i = 0; i < descubres.length; i++){
		descubres[i]["visible"] = false;
	}
	for(var i = 0; i < visibles.length; i++){
		descubres[visibles[i]["index"]]["visible"] = true;
		$("#frame-" + visibles[i]["index"]).css("opacity","1");
	}
	for(var i = 0; i < descubres.length; i++){
		$("#frame-" + i).css({"opacity" : (descubres[i]["visible"] ? "1" : "0"), "visibility" : (descubres[i]["visible"] ? "visible" : "hidden"), "width" : (descubres[i]["visible"] ? "" : "0") });
	}
}

function limpiarPuntuacion(tags){
	var new_tags = tags.replace(/[íïîì]/i,"i");
	new_tags = new_tags.replace(/[áäâà]/i,"a");
	new_tags = new_tags.replace(/[éëêè]/i,"e");
	new_tags = new_tags.replace(/[óöôò]/i,"o");
	new_tags = new_tags.replace(/[úüûù]/i,"u");
	return new_tags;
}

function construirDescubre(descubres){
	if(descubres.length == 0)
		return "Ningún resultado coincide con los parámetros de búsqueda";
	var html_str = "";
	for(var i = 0; i < descubres.length; i++){
		html_str = html_str + "<div class=\"frame-descubre\" id=\"frame-" + i + "\">";
		if(descubres[i]["imagen_file_name"] != null){
			var path_img = "/assets/descubre/" + descubres[i]["id"] + "/original/" + descubres[i]["imagen_file_name"];
			html_str = html_str + "<img class=\"imagen-descubre\" src=\"" + path_img + "\" >";
		}
		else{
			html_str = html_str + "<p><span class=\"cont-descubre\">" + descubres[i]["contenido"] + "</span></p>";
			html_str = html_str + "<p><span class=\"titulo-descubre\">" + descubres[i]["titulo"] + "</span></p>";
		}
		html_str = html_str + "<a href=\""+ descubres[i]["liga"] + "\" " + (descubres[i]["contenido"].toLowerCase() == "video" ? ("data-uk-lightbox title=\"\"") : "target=\"_blank\"" ) + "><div class=\"frame-hover\">";
		html_str = html_str + "<span class=\"cont-descubre\">" + descubres[i]["contenido"] + "</span><br />";
		html_str = html_str + "<span class=\"titulo-descubre\">" + descubres[i]["titulo"] + "</span>";
		html_str = html_str + "<img class=\"icono-descubre\" src=\"" + encontrarIconoDescubre(descubres[i]["contenido"]) + "\" >";
		html_str = html_str + "</div></a></div>";		
	}
	return html_str;
}

function encontrarIconoDescubre(tipo_desc){
	for(var i = 0; i < gon.contenido_iconos.length; i++){
		if(gon.contenido_iconos[i]["tipo"].toLowerCase() == tipo_desc.toLowerCase()){
			if(gon.contenido_iconos[i]["icono_file_name"] != null)
				return "/assets/contenidos/" + gon.contenido_iconos[i]["id"] + "/original/" + gon.contenido_iconos[i]["icono_file_name"];
			return "/link.png";
		}
	}
}


