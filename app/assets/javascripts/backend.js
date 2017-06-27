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

function adjustWidths(cols){
	return (100/cols) + "%";
}

function hideLink(event,element,link,method){
	event.preventDefault();
	$(element).append('<a ' + (method == "DELETE" ? 'data-method="'+method+'" rel="nofollow" data-remote=true data-confirm="¿Seguro que desea eliminar el objeto?"' : "data-remote=true") + ' href="'+link+'" style="display:none;" id="vlink"></a>');
	$("#vlink").trigger("click");
	$("#vlink").remove();
}

function readURL(input,display) {
  if (input.files && input.files[0]) {
		console.log(input);
    var reader = new FileReader();
    
    reader.onload = function (e) {
        $(display).attr('src', e.target.result);
    }
    
    reader.readAsDataURL(input.files[0]);
  }
}
