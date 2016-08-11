$(document).ready(function(){
	$(document).trigger("scroll", [$(document).scrollTop()]);
});

window.onresize = function(){
	console.log(valor + "Algo");
	$(document).trigger("scroll", [$(document).scrollTop()]);
}

$(window).on("orientationchange",function(){
	$(window).trigger("resize");
});
