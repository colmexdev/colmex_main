ancho = Math.max(document.documentElement.clientWidth, window.innerWidth || document.body.ClientWidth || 0);

					$(document).ready(function(){
						var ancho_slide = $("#div_slider").width();
						var alto_slide = ancho_slide*(9/16);
						var cw = $('.frame-descubre').width();

						if(gon.ev_tiny == ""){
								$("#div_eventos").css("height","0");
						}
						else{
							if(ancho < 600){ document.getElementById("render_eventos").innerHTML = gon.ev_tiny; }
							else if(ancho < 900){ document.getElementById("render_eventos").innerHTML = gon.ev_small; }
							else{ document.getElementById("render_eventos").innerHTML = gon.ev_big;}
						}

						$('.frame-descubre').css({'height':cw+'px'});
						$('#div_slider').css({'height':alto_slide+'px'});
					});

					window.onresize = function(){
						var cw = $('.frame-descubre').width();
						var ancho_slide = $("#div_slider").width();
						var alto_slide = ancho_slide*(9/16);
						var ancho_act = Math.max(document.documentElement.clientWidth, window.innerWidth || document.body.ClientWidth || 0);

						$('#div_slider').css({'height':alto_slide+'px'});
						$('.frame-descubre').css({'height':cw+'px'});

						if(ancho_act < 785 && ancho >= 785){
							document.getElementById("render_eventos").innerHTML = gon.ev_tiny;
							ancho = ancho_act;
						}
						else if(ancho_act < 1024 && (ancho >= 1024 || ancho <= 785)){
							document.getElementById("render_eventos").innerHTML = gon.ev_small;
							ancho = ancho_act;
						} 
						else if(ancho_act >= 1024 && ancho < 1024){
							document.getElementById("render_eventos").innerHTML = gon.ev_big;
							ancho = ancho_act;
						}
					}
