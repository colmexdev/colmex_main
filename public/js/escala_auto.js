$(document).ready(function(){
	var valor = $(document).scrollTop();
	$(document).trigger("scroll", [valor]);
});

window.onresize = function(){
	var valor = $(document).scrollTop();
	$(document).trigger("scroll", [valor]);
}

$(window).on("orientationchange",function(){
	$(window).trigger("resize");
});
