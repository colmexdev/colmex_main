$(document).on("scroll", function(event) {
  var y = $(this).scrollTop();
  var ancho_act = Math.max(document.documentElement.clientWidth, window.innerWidth || document.body.ClientWidth || 0);
	try{
		ligas();
	} catch(err) {}
	try{
		var alto_logo = document.getElementById("div_logo").clientHeight;
		if (y > 200 || barra_render) {
			$("#forma-search").css("display", "none");

			$("#img_logo").stop().css({"height" : "0", "margin": "0"});
			$("#div_logo").stop().css({"height": "0", "min-height": "0", "margin": "0"});
			$("#div_logo a").stop().css({"font-size": "0px"});
			$("#div_menu ul li a span").stop().css({"font-size" : "0"});
			$("#div_menu").stop().css({"height": 0, "min-height": "0"});

			$("#search-lat").removeAttr("style");
			$(".reajustable").removeAttr("style");
			$("#contenedor_nav").css({"min-height":"60px","background-color":"#fff","-webkit-box-shadow":"0 6px 12px rgba(0,0,0,0.175)","-moz-box-shadow":"0 6px 12px rgba(0,0,0,0.175)","box-shadow":"0 6px 12px rgba(0,0,0,0.175)"});
			$("#barra_nav").css({"height":"100%","background-color":"#fff", "width":"90%","margin": "0 auto"});
			$(".reajustable").css("display","inline-block");
			$("#logo-main").css({"display":"block","padding-left":""});
			if(ancho_act > 1165){
				$("#search-lat").css("display","none");
				$("#idioma-big-scroll").css("display","block");
				$("#idioma-small-scroll").removeAttr("style");
				$("#idioma-top").css("display","none");
				$(".mail").css("display","none");
				$(".intranet").css("display","none");	
				$(".borrable").css("display","none");
				$(".navbar-right").css("display","none");
				$("#header-links").css({"display":"inline-block", "background-color":"#fff", "padding-left":"0","float":"right" });
				$("#boton-top").css("display","block");
			}
			else{
				if(ancho_act < 768){
			 	$(".reajustable").css("width","100%");
				}
				else{
					$(".reajustable").removeAttr("style");
				}
				if(ancho_act > 1165){
					$("#idioma-big-scroll").css("display","block");
					$("#idioma-small-scroll").removeAttr("style");
				}
				else{
					$("#idioma-small-scroll").css("display","block");
					$("#idioma-big-scroll").removeAttr("style");
				}
				if(ancho_act < 435){
					$("#idioma-small-scroll").css("display","none");
				}
				else{
					$("#idioma-small-scroll").css("display", "block");
				}
				$("#idioma-top").css("display","none");
				$("#boton-top").css("display","block");
				$("#logo-main").css("padding-left", "10px");
				$(".uk-navbar-toggle").css({"line-height":"60px","padding":"0","float":"right", "margin-top":"0"});
				$("#barra_nav").css("width","100%");
				$(".mail").removeAttr("style");
				$(".intranet").removeAttr("style");
				$(".mail a").css("line-height","60px");
				$(".intranet a").css("line-height","60px");
				$(".borrable").removeAttr("style");
				$(".navbar-right").removeAttr("style");;
				$("#header-links").css("display", "none");
			}
		}
		else{
			barra_render = false;
			if(ancho_act <= 1165){
				$("#search-lat").removeAttr("style");
				$("#forma-search").css("display","none");
			}
			else{
				$("#search-lat").css("display","none");
				$("#forma-search").removeAttr("style");
			}
			//$("#forma-busqueda").removeAttr("style");
			$("#idioma-big-scroll").removeAttr("style");
			$("#idioma-small-scroll").removeAttr("style");
			$("#idioma-top").removeAttr("style");
			$(".mail a").removeAttr("style");
			$(".intranet a").removeAttr("style");
			$("#boton-top").removeAttr("style");
			$(".reajustable").removeAttr("style");
			$(".uk-navbar-toggle").removeAttr("style");
			$("#contenedor_nav").removeAttr("style");
			$("#barra_nav").removeAttr("style");
			$(".reajustable").removeAttr("style");
			$("#logo-main").removeAttr("style");

			$("#img_logo").stop().removeAttr("style");
			$("#div_logo").stop().removeAttr("style");
			$("#div_logo a").stop().removeAttr("style");
			$("#div_menu").stop().removeAttr("style");
			$("#div_menu ul li a span").stop().removeAttr("style");

			$(".borrable").removeAttr("style");
			$(".mail").removeAttr("style");
			$(".intranet").removeAttr("style");
			$(".navbar-right").removeAttr("style");
			$("#header-links").removeAttr("style");
		}
			reescalarFrames();
			ajustarCuerpo(y);
	} catch(err){

	}
});

function reescalarFrames(){
	var frames = document.getElementsByTagName("iframe");
	for(var i = 0; i < frames.length - 1; i++){
		if(frames[i].clientWidth < 560){
			frames[i].height = frames[i].clientWidth*315/560;
		}
		else
			frames[i].height = 315;
	}
}

function ajustarCuerpo(scroll){
  var ancho_act = Math.max(document.documentElement.clientWidth, window.innerWidth || document.body.ClientWidth || 0);
	var alto_footer = (document.getElementById("div_footer") != null ? document.getElementById('div_footer').clientHeight : 265);
	var alto_header = (document.getElementById("header") != null ? document.getElementById('header').clientHeight : 225);
	$('#resto-cuerpo').css({'padding-bottom': (alto_footer+1)+'px', 'padding-top': (ancho_act <= 1165 ? (alto_header + 1) : '225') + 'px'});
}

function regresarArriba(){
	$("html, body").animate({ scrollTop: 0 }, 1800);
  return false;
}

function ligas(){
	for(var i = 0; i < $("#cuerpo a").length; i++){
		if(($("#cuerpo a")[i].href.indexOf(window.location.origin) != -1 && $("#cuerpo a")[i].href.indexOf("pdfs") != -1) || $("#cuerpo a")[i].href.indexOf(window.location.origin) == -1)
			$("#cuerpo a")[i].target = "_blank";
	}
}

function initAddThis(){
    // Remove all global properties set by addthis, otherwise it won't reinitialize
    for (var i in window) {
        if (/^addthis/.test(i) || /^_at/.test(i)) {
            delete window[i];
        }
    }
    window.addthis_share = null;

    // Finally, load addthis
    $.getScript("https://s7.addthis.com/js/300/addthis_widget.js#pubid=ra-57bb682464651c22");
}
