barra_render = false;

$(document).ready(function(){
	barra_render = (!(($(document).scrollTop() > 300 && window.innerHeight > 872) || ($(document).scrollTop() > 150 && window.innerHeight <= 872)) ? false : true );
	$(document).trigger("scroll");
});

window.onresize = function(){
	barra_render = (!(($(document).scrollTop() > 300 && window.innerHeight > 872) || ($(document).scrollTop() > 150 && window.innerHeight <= 872)) ? false : true );
	$(document).trigger("scroll");
}

$(window).on("orientationchange",function(){
	$(window).trigger("resize");
});
