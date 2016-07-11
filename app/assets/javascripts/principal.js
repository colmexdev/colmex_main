var ancho = $(window).width();
var html1;
var html2;

$(document).ready(function(){
	console.log("Hola mundo");
	$(window).resize(parseHTML(gon.ev_big, gon.ev_small));
});

function parseHTML(divs_big, divs_small){
	var ancho_act = $(window).width();
	console.log(ancho);
	/*if(ancho_act < 900 && ancho >= 900){
		console.log(divs_small);
		ancho = ancho_act;
	} 
	else if(ancho_act >= 900 && ancho < 900){
		console.log(divs_big);
		ancho = ancho_act;
	}*/
}
