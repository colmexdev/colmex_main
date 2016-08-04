function filtrarDescubres(){
	descubresPorTags.filterAll();
	descubresPorContenido.filterAll();
	var contAFiltrar = $("#contenido").val();
	var tagsAFiltrar = $("#tags").val();
	var descubresFiltradosPorContenido = descubresPorContenido.filter(function(d){ return ( contAFiltrar == "" ? true : d == contAFiltrar )}).top(Infinity);
	var descubresFiltradosPorTags = descubresPorTags.filter(function(d){ return (tagsAFiltrar == "" ? true : limpiarPuntuacion(d).indexOf(tagsAFiltrar) != -1)}).top(Infinity);
	actualizarVisibleDescubres(descubresFiltradosPorTags);

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
		$("#frame-" + i).css({"opacity" : (descubres[i]["visible"] ? "1" : "0"), "visibility" : (descubres[i]["visible"] ? "visible" : "hidden"), "width" : (descubres[i]["visible"] ? "" : "0"), "height" : (descubres[i]["visible"] ? $("#frame-" + i).width() + "px" : "0") });
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
