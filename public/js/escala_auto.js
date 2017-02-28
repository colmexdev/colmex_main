barra_render = false;

$(document).on("ready page:change page:load",function(){
	initAddThis();
	$(document).trigger("scroll");
});

window.onresize = function(){

	$(document).trigger("scroll");
}

$(window).on("orientationchange",function(){
	$(window).trigger("resize");
});
