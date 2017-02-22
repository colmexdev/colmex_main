function filtrarDescubres(){
	descubresPorTags.filterAll();
	descubresPorContenido.filterAll();
	var contAFiltrar = $("#contenido").val();
	var tagsAFiltrar = $("#tags").val();
	var descubresFiltradosPorContenido = descubresPorContenido.filter(function(d){ return ( contAFiltrar == "" ? true : d == contAFiltrar )}).top(Infinity);
	var descubresFiltradosPorTags = descubresPorTags.filter(function(d){ return (tagsAFiltrar == "" ? true : limpiarPuntuacion(d).indexOf(tagsAFiltrar) != -1)}).top(Infinity);
	actualizarVisibleDescubres(descubresFiltradosPorTags);
	renderFrase(descubresFiltradosPorTags);
	$("#wrapper").css({"height" : "auto", "padding-bottom" : "45px" });
	$("#cutter-descubre").css("display","none");
}

function renderFrase(arreglo){
	uno_visible = false;
	var borrar_frase = (document.getElementById("frase-desc") != null && arreglo.length > 0);
	for(var i = 0; i < descubres.length; i++){
		if(descubres[i]["visible"]){
			uno_visible = true;
			break;
		}
	}
	if(!uno_visible){
		setTimeout(function(){
			$("#frase-desc").remove();
			$("#wrapper").append("<div id=\"frase-desc\">Ningún contenido coincide con su búsqueda.</div>");}, 850);
	}	
	else{
		$("#frase-desc").remove();
	}
}

function actualizarVisibleDescubres(visibles){
	for(var i = 0; i < descubres.length; i++){
		descubres[i]["visible"] = false;
	}
	for(var i = 0; i < visibles.length; i++){
		descubres[visibles[i]["index"]]["visible"] = true;
	}
	reescalarDescubre();
}

function reescalarDescubre(){
	for(var i = 0; i < descubres.length; i++){
		$("#frame-"+i).removeClass(descubres[i]["visible"] ? "revanimate" : "animate").addClass(!descubres[i]["visible"] ? "revanimate" : "animate").css({"height": (descubres[i]["visible"] ? ajustarAlturas(i) : "0"), "width" : (descubres[i]["visible"] ? "" : 0), "border" : (descubres[i]["visible"] ? "solid 4px #fff" : "none") });
	}
}

function ajustarAlturas(i){
	var ancho = Math.max(document.documentElement.clientWidth, window.innerWidth || document.body.ClientWidth || 0);
	var factor = (ancho > 1200 ? 5 : (ancho > 992 ? 4 : ( ancho > 768 ? 3 : ( ancho > 480 ? 2 : 1))))
	return ($("#wrapper").innerWidth()/factor) + "px";
}

function limpiarPuntuacion(tags){
	var new_tags = tags.replace(/[íïîìÍÏÎÌ]/gi,"i");
	new_tags = new_tags.replace(/[áäâàÁÄÂÀ]/gi,"a");
	new_tags = new_tags.replace(/[éëêèÉËÊÈ]/gi,"e");
	new_tags = new_tags.replace(/[óöôòÓÖÔÒ]/gi,"o");
	new_tags = new_tags.replace(/[úüûùÚÜÛÙ]/gi,"u");
	return new_tags;
}
