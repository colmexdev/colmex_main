var w = Math.max(document.documentElement.clientWidth, window.innerWidth || 0);
var h = Math.max(document.documentElement.clientHeight, window.innerHeight || 0);

window.addEventListener('resize', parseHTML(gon.ev_big, gon.ev_small), true);

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
