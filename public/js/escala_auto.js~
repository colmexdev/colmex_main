barra_render = false;

$(document).ready(function(){
	barra_render = (((y > 300 && window.innerHeight > 872) || (y > 150 && window.innerHeight <= 872)) : false : true );
	$(document).trigger("scroll");
});

window.onresize = function(){
	barra_render = (((y > 300 && window.innerHeight > 872) || (y > 150 && window.innerHeight <= 872)) : false : true );
	$(document).trigger("scroll");
}

$(window).on("orientationchange",function(){
	$(window).trigger("resize");
});
