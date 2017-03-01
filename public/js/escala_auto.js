barra_render = false;

$(document).on("ready",function(){
	initAddThis();
	$(document).trigger("scroll");
});

window.onresize = function(){

	$(document).trigger("scroll");
}

$(window).on("orientationchange",function(){
	$(window).trigger("resize");
});
