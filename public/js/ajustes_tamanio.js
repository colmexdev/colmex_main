ancho = Math.max(document.documentElement.clientWidth, window.innerWidth || document.body.ClientWidth || 0);
dataset = crossfilter(JSON.parse(gon.descubres));
	descubresPorContenido = dataset.dimension(function(d){ return d.contenido; });
	descubresPorTags = dataset.dimension(function(d){ return (d.titulo + " " + d.contenido + " " + d.tags.replace(/ *, */, " ")).toLowerCase()});

$(document).ready(function(){
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

	partirDescubres();
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

	partirDescubres();
}

function partirDescubres(){
	var ancho_v = Math.max(document.documentElement.clientWidth, window.innerWidth || document.body.ClientWidth || 0);
	var json_l = JSON.parse(gon.descubres).length;
	var alto_d = $(".frame-descubre").width();
	$("#wrapper").css({"height" : (alto_d * 2) + "px", "overflow-y" : "hidden" });
	if((json_l > 10 && ancho_v >= 1340) || (json_l > 8 && ancho_v >= 1050 && ancho_v < 1340) || (json_l > 6 && ancho_v >= 700 && ancho_v < 1050) || (json_l >4 && ancho_v >= 450 && ancho_v < 700) || (json_l > 3 && ancho_v < 450)){
		$("#cutter-descubre").css("display","block");
	}
	else{
		$("#cutter-descubre").css("display","none");
	}
	return false;
}

function desbordarDescubres(){
	$("#cutter-descubre").css("display","none");
	$("#wrapper").css({"height" : "auto", "overflow-y" : "visible" });
	return false;
}

