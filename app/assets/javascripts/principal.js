ancho = Math.max(document.documentElement.clientWidth, window.innerWidth || document.body.ClientWidth || 0);

window.onresize = function(){
	var ancho_act = Math.max(document.documentElement.clientWidth, window.innerWidth || document.body.ClientWidth || 0);;
	if(ancho_act < 900 && ancho >= 900){
		console.log(gon.ev_small);
		ancho = ancho_act;
	} 
	else if(ancho_act >= 900 && ancho < 900){
		console.log(gon.ev_big);
		ancho = ancho_act;
	}
}

