ancho = Math.max(document.documentElement.clientWidth, window.innerWidth || document.body.ClientWidth || 0);

$(document).ready(function(){
	dataset = crossfilter(JSON.parse(gon.descubres));
	descubresPorContenido = dataset.dimension(function(d){ return d.contenido; });
	descubresPorTags = dataset.dimension(function(d){ return d.titulo + " " + d.contenido + " " + d.tags.replace(/ *, */, " ")});
	var alto_footer = $('#div_footer').height();
	var alto_header = $('#header').height();
	var ancho_slide = $("#div_slider").width();
	var alto_slide = ancho_slide*(17/40);
	var cw = $('.frame-descubre').width();

	if(gon.ev_tiny == ""){
			$("#div_eventos").css("height","0");
	}
	else{
		if(ancho < 600){ document.getElementById("render_eventos").innerHTML = gon.ev_tiny; }
		else if(ancho < 1150){ document.getElementById("render_eventos").innerHTML = gon.ev_small; }
		else{ document.getElementById("render_eventos").innerHTML = gon.ev_big;}
	}

	$('#resto-cuerpo').css({'padding-bottom': alto_footer+'px', 'padding-top': alto_header+'px'});

	$('.frame-descubre').css({'height':cw+'px'});
	$('#div_slider').css({'height':alto_slide+'px'});
});

window.onresize = function(){
	var alto_footer = $('#div_footer').height();
	var alto_header = $('#header').height();
	var cw = $('.frame-descubre').width();
	var ancho_slide = $("#div_slider").width();
	var alto_slide = ancho_slide*(17/40);
	var ancho_act = Math.max(document.documentElement.clientWidth, window.innerWidth || document.body.ClientWidth || 0);

	$('#resto-cuerpo').css({'padding-bottom': alto_footer+'px', 'padding-top': alto_header+'px'});

	$('#div_slider').css({'height':alto_slide+'px'});
	$('.frame-descubre').css({'height':cw+'px'});

	if(ancho_act < 785 && ancho >= 785){
		document.getElementById("render_eventos").innerHTML = gon.ev_tiny;
		ancho = ancho_act;
	}
	else if(ancho_act < 1150 && (ancho >= 1150 || ancho <= 785)){
		document.getElementById("render_eventos").innerHTML = gon.ev_small;
		ancho = ancho_act;
	} 
	else if(ancho_act >= 1150 && ancho < 1150){
		document.getElementById("render_eventos").innerHTML = gon.ev_big;
		ancho = ancho_act;
	}
}


