$(document).ready(function(){
	var alto_footer = $('#div_footer').height();
	var alto_header = $('#header').height();

	$('#resto-cuerpo').css({'padding-bottom': alto_footer+'px', 'padding-top': alto_header+'px'});
});

window.onresize = function(){
	var alto_footer = $('#div_footer').height();
	var alto_header = $('#header').height();

	$('#resto-cuerpo').css({'padding-bottom': alto_footer+'px', 'padding-top': alto_header+'px'});
}
