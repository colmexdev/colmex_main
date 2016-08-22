function filtrarDescubres(){
	descubresPorTags.filterAll();
	descubresPorContenido.filterAll();
	var contAFiltrar = $("#contenido").val();
	var tagsAFiltrar = $("#tags").val();
	var descubresFiltradosPorContenido = descubresPorContenido.filter(function(d){ return ( contAFiltrar == "" ? true : d == contAFiltrar )}).top(Infinity);
	var descubresFiltradosPorTags = descubresPorTags.filter(function(d){ return (tagsAFiltrar == "" ? true : limpiarPuntuacion(d).indexOf(tagsAFiltrar) != -1)}).top(Infinity);
	actualizarVisibleDescubres(descubresFiltradosPorTags);
	renderFrase();
	$("#wrapper").css({"height" : "auto", "margin-bottom" : "45px" });
	$("#cutter-descubre").css("display","none");
}

function renderFrase(){
	uno_visible = false;
	for(var i = 0; i < descubres.length; i++){
		if(descubres[i]["visible"]){
			uno_visible = true;
			break;
		}
	}
	$("#frase-desc").remove();
	if(!uno_visible){
		$("#wrapper").append("<div id=\"frase-desc\">Ningún contenido coincide con su búsqueda.</div>");
	}
}

function actualizarVisibleDescubres(visibles){
	for(var i = 0; i < descubres.length; i++){
		descubres[i]["visible"] = false;
		//$("#frame-"+i).css({"-webkit-transition": "opacity 0.5s linear 0.2s, visibility 0.5s linear, width 0.2s linear, height 0s linear 0s", "-moz-transition": "opacity 0.5s linear 0.2s, visibility 0.5s linear, width 0.2s linear, height 0s linear 0s", "-ms-transition": "opacity 0.5s linear 0.2s, visibility 0.5s linear, width 0.2s linear, height 0s linear 0s", "-o-transition": "opacity 0.5s linear 0.2s, visibility 0.5s linear, width 0.2s linear, height 0s linear 0s","transition": "opacity 0.5s linear 0.2s, visibility 0.5s linear, width 0.2s linear, height 0s linear 0s"});
	}
	for(var i = 0; i < visibles.length; i++){
		descubres[visibles[i]["index"]]["visible"] = true;
		//$("#frame-"+i).removeAttr("style");
		//$("#frame-" + visibles[i]["index"]).css("opacity","1");
	}
	reescalarDescubre();
}

function reescalarDescubre(){
	for(var i = 0; i < descubres.length; i++){
		//$("#frame-" + i).css({"opacity" : (descubres[i]["visible"] ? "1" : "0"), "visibility" : (descubres[i]["visible"] ? "visible" : "hidden"), "width" : (descubres[i]["visible"] ? "" : "0"), "height" : (descubres[i]["visible"] ? ajustarAlturas() : "0") });
		$("#frame-"+i).removeClass(descubres[i]["visible"] ? "revanimate" : "animate").addClass(!descubres[i]["visible"] ? "revanimate" : "animate").css("height", (descubres[i]["visible"] ? ajustarAlturas() : "0"));
	}
}

function ajustarAlturas(){
	var ancho = Math.max(document.documentElement.clientWidth, window.innerWidth || document.body.ClientWidth || 0);
	var factor = (ancho >= 1200 ? 5 : (ancho >= 992 ? 4 : ( ancho >= 768 ? 3 : ( ancho >= 480 ? 2 : 1))))
	return ($("#wrapper").innerWidth()/factor) + "px";
}

function limpiarPuntuacion(tags){
	var new_tags = tags.replace(/[íïîì]/i,"i");
	new_tags = new_tags.replace(/[áäâà]/i,"a");
	new_tags = new_tags.replace(/[éëêè]/i,"e");
	new_tags = new_tags.replace(/[óöôò]/i,"o");
	new_tags = new_tags.replace(/[úüûù]/i,"u");
	return new_tags;
}
