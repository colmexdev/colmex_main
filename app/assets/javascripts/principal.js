ancho = Math.max(document.documentElement.clientWidth, window.innerWidth || document.body.ClientWidth || 0);

$(window).on('resize', function(){
	var ancho_act = $(window).width();
	if(ancho_act < 900 && ancho >= 900){
		console.log(divs_small);
		ancho = ancho_act;
	} 
	else if(ancho_act >= 900 && ancho < 900){
		console.log(divs_big);
		ancho = ancho_act;
	}
});

