var ancho = $(window).width();
var html1;
var html2;

$(document).ready(function(){
	html1 = $('#html_big').innerHTML;
	html2 = $('#html_small').innerHTML;
	$(window).resize(parseHTML());
});

function parseHTML(divs_big, divs_small){
	var ancho_act = $(window).width();
	if(ancho_act < 900 && ancho >= 900){
		console.log(divs_small);
		ancho = ancho_act;
	} 
	else if(ancho_act >= 900 && ancho < 900){
		console.log(divs_big);
		ancho = ancho_act;
	}
}
