ancho = Math.max(document.documentElement.clientWidth, window.innerWidth || document.body.ClientWidth || 0);
dataset = crossfilter(JSON.parse(gon.descubres));
descubresPorContenido = dataset.dimension(function(d){ return d.contenido; });
descubresPorTags = dataset.dimension(function(d){ return (d.titulo + " " + d.contenido + " " + d.tags.replace(/ *, */, " ")).toLowerCase()});
num_filas = 2;

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
		if(ancho < 785){ document.getElementById("render_eventos").innerHTML = gon.ev_tiny; }
		else if(ancho < 1150){ document.getElementById("render_eventos").innerHTML = gon.ev_small; }
		else{ document.getElementById("render_eventos").innerHTML = gon.ev_big;}
	}

	$('#resto-cuerpo').css({'padding-bottom': alto_footer+'px', 'padding-top': alto_header+'px'});

	$('.frame-descubre').css({'height':cw+'px'});
	$('#div_slider').css({'height':alto_slide+'px'});

	partirDescubres();
	ajustarImagenes();
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
	margenAuto();
	ajustarImagenes();
}

function partirDescubres(){
	var ancho_v = Math.max(document.documentElement.clientWidth, window.innerWidth || document.body.ClientWidth || 0);
	var json_l = JSON.parse(gon.descubres).length;
	var alto_d = $(".frame-descubre").height();
	$("#wrapper").css({"height" : ((($("#wrapper").height() >= alto_d * num_filas) || document.getElementById("wrapper").style.height == "auto") ? "auto" : (alto_d * num_filas) + "px"), "overflow-y" : "hidden", "-webkit-transition" : "height 0.5s linear", "-moz-transition" : "height 0.5s linear", "-o-transition" : "height 0.5s linear", "transition" : "height 0.5s linear"});
	if(((json_l > 10 && ancho_v >= 1200 ) || (json_l > 8 && ancho_v >= 992 && ancho_v < 1200) || (json_l > 6 && ancho_v >= 768 && ancho_v < 992) || (json_l >4 && ancho_v >= 480 && ancho_v < 768) || (json_l > 3 && ancho_v < 480)) && document.getElementById("wrapper").style.height != "auto"){
		$("#cutter-descubre").css("display","block");
	}
	else{
		$("#cutter-descubre").css("display","none");
	}

	return false;
}

function desbordarDescubres(){
	var ancho_v = Math.max(document.documentElement.clientWidth, window.innerWidth || document.body.ClientWidth || 0);
	if(document.getElementById("wrapper").style.height != "auto"){
		num_filas = num_filas + 2;
	}
	var div_filas = (ancho_v >= 1200 ? 5 : (ancho_v >= 992 ? 4 : (ancho_v >= 768 ? 3 : (ancho_v >= 480 ? 2 : 1))));
	var cantidad_filas = Math.ceil(JSON.parse(gon.descubres).length / div_filas);
	$("#wrapper").css({"height" : (($("#wrapper").height() + (($(".frame-descubre").height() * 2)) > ($(".frame-descubre").height() * cantidad_filas) || document.getElementById("wrapper").style.height == "auto" ) ? "auto" : ($(".frame-descubre").height() * num_filas) + "px")});
	$("#cutter-descubre").css("display", $("#wrapper").height() + ($(".frame-descubre").height() * 2) >= ($(".frame-descubre").height() * cantidad_filas)  ? "none" : "block");

	margenAuto();
	return false;
}

function margenAuto(){
	if(document.getElementById("cutter-descubre").style.display == "none"){
		$("#wrapper").css("margin-bottom", "45px");
	}
}

function ajustarImagenes(){
	var ancho_izq = $("#col-izq").innerWidth();
	var ancho_ct = $("#col-ct").innerWidth();
	var ancho_der = $("#col-der").innerWidth();
	var img_izq = $("#img-pub").width();
	var img_pred = $("#img-pred").width();
	var img_rev = $("#img-rev").width();

	if(ancho_izq - 10 < img_izq){
		$("#img-pub").css("width","90%");
	}
	else{
		$("#img-pub").removeAttr("style");
	}
	if(window.innerWidth <= 768){
		if(ancho_ct - 10 < img_rev){
			$("#img-rev").css("width","90%");
		}
		else{
			$("#img-rev").removeAttr("style");
		}
		if(ancho_der - 10 < img_pred){
			$("#img-pred").css("width","90%");
		}
		else{
			$("#img-pred").removeAttr("style");
		}
	}
	else{
		if(ancho_ct - 10 < img_pred){
			$("#img-pred").css("width","90%");
		}
		else{
			$("#img-pred").removeAttr("style");
		}
		if(ancho_der - 10 < img_rev){
			$("#img-rev").css("width","90%");
		}
		else{
			$("#img-rev").removeAttr("style");
		}
	}
}

