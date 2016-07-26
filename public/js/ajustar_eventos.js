ancho = Math.max(document.documentElement.clientWidth, window.innerWidth || document.body.ClientWidth || 0);

            $(document).ready(function(){
							if(gon.ev_tiny == ""){
								$("#div_eventos").css("height","0");
								return false;
							}

							if(ancho < 600){ document.getElementById("render_eventos").innerHTML = gon.ev_tiny; }
							else if(ancho < 900){ document.getElementById("render_eventos").innerHTML = gon.ev_small; }
							else{ document.getElementById("render_eventos").innerHTML = gon.ev_big;}
						});

						window.onresize = function(){
							var ancho_act = Math.max(document.documentElement.clientWidth, window.innerWidth || document.body.ClientWidth || 0);
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
