function changeToggle(over){
	var tog = (over == 0);
	$("#but-toggle").css({"background-color": (tog ? "#DCDCDC" : "")});
	$("#bar-s").css({"background-color": (tog == 0 ? "#A9A9A9" : "")});
	$("#bar-m").css({"background-color": (tog == 0 ? "#A9A9A9" : "")});
	$("#bar-i").css({"background-color": (tog == 0 ? "#A9A9A9" : "")});
}

function slideMenu(){
	var slide = ($("#menu-lat").width() == 0);
	$("#menu-lat").css({"width": (slide ? "" : "0px") });
	$("#graphs-gest").css({"width": (slide ? "" : "100%")});
}