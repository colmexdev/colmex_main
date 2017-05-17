
function partirDirectorio(visibles){
	var apartados;
	vistas = Math.floor(visibles.length/15);
	if(visibles.length%15 == 0)
		vistas = vistas - 1;
	var i;
	$("#separadores").html("<div class=\"numeros\" style=\"margin:0 2px;display:inline-block;cursor:pointer;\" id=\"sep-ant\" onclick=\"muestra("+"'ant'"+")\">" + "\<" + "</div>");
	for(i=0; i<=vistas; i++){
		$("#separadores").append("<div class=\"numeros\" style=\"margin:0 5px;display:inline-block;cursor:pointer;\" id=\"sep-" + i + "\" onclick=\"muestra("+i+")\">" + (i+1) + "</div>");
	}
	$("#separadores").append("<div class=\"numeros\" style=\"margin:0 2px;display:inline-block;cursor:pointer;\" id=\"sep-sig\" onclick=\"muestra("+"'sig'"+")\">" + "\>" + "</div>");
	muestra(0);
}


function filtrarDirectorio(b){
	b = b || '0';
	var accordion = UIkit.accordion(UIkit.$('#acordeon'));
	accordion.find('[data-wrapper]').each(function(){
		if(UIkit.$(this)[0].firstElementChild.className.indexOf("uk-active") != -1){
			accordion.toggleItem(UIkit.$(this), true, true); 
		}
	});
	academicosPorNombre.filterAll();
//	academicosPorTema.filterAll();
	academicosPorLinea.filterAll();
	academicosPorCentro.filterAll();
	academicosPorInicial.filterAll();
	var busqueda = [];
	if(b != '0'){
		$("#nombre").val("");
		$("#linea").val((typeof b === 'object' ? b.innerHTML : ""));
		//$("#linea").val("");
		$("#contenido").val("");
		busqueda = (typeof b === 'object' ? b.innerHTML : b);
	}
	var centrosAFiltrar = $("#contenido").val();
	var nombresAFiltrar = limpiarPuntuacion($("#nombre").val().toLowerCase()).split(/ +/);
//	var temasAFiltrar = limpiarPuntuacion($("#linea").val().toLowerCase()).split(/[ ]+/);
	var lineasAFiltrar = limpiarPuntuacion($("#linea").val().toLowerCase()).split(/ +/);
	if(typeof busqueda === 'object'){
		if($("#contenido").val() != "") busqueda.push("(Centro: " + $("#contenido").val() + ")");
		if($("#nombre").val() != "") busqueda.push("(Nombre: " + $("#nombre").val() + ")");
		//if($("#correo").val() != "") busqueda.push("(Línea(s): " + $("#correo").val() + ")");
		if($("#linea").val() != "") busqueda.push("(Tema(s): " + $("#linea").val() + ")");
	}

	var academicosFiltradosPorCentro = academicosPorCentro.filter(function(d){ return ( (b != '0' || centrosAFiltrar == "") ? true : d == centrosAFiltrar )}).top(Infinity);
	var academicosFiltradosPorNombre = academicosPorNombre.filter(function(d){
		if(b != '0' || nombresAFiltrar.join("").split("").length == 0) return true;
		//var nombre = limpiarPuntuacion(d.toLowerCase()); 
		for(var j = 0; j < nombresAFiltrar.length; j++){
			if(d.indexOf(nombresAFiltrar[j]) == -1) return false;
		}
		return true;

	}).top(Infinity);
	var academicosFiltradosPorInicial = academicosPorInicial.filter(function(d){ return ((typeof b === 'object' ||  b == '0') ? true : d == b)}).top(Infinity);

/*	var academicosFiltradosPorTema = academicosPorTema.filter(function(d){ 
		if( (typeof b !== 'object') && temasAFiltrar == []) return true;
		var linea = limpiarPuntuacion(d.toLowerCase());
		if(typeof b === 'object'){
			return linea.indexOf(limpiarPuntuacion(b.innerHTML.toLowerCase())) != -1;}
		else{
			for(var j = 0; j < temasAFiltrar.length; j++){
				if(linea.indexOf(temasAFiltrar[j]) == -1) return false;
			}
			return true;
		}
		//return ((b != '0' ||correosAFiltrar == "") ? true : limpiarPuntuacion(d.toLowerCase()).indexOf(correosAFiltrar.toLowerCase()) != -1)
	}).top(Infinity); */
	var academicosFiltradosPorLinea = academicosPorLinea.filter(function(d){ 
		if(lineasAFiltrar.join("").split("").length == 0) return true;

		for(var j = 0; j < lineasAFiltrar.length; j++){
			if(d.indexOf(lineasAFiltrar[j]) == -1) return false;
		}
		return true;
	}).top(Infinity);
	vista_act = 0;
	$(".inics").css({"color" : "#909090"});
	if(typeof b !== 'object' && b != '0'){
		$("#inic_"+b).css({"color" : "#993366"});
	}

	mostrarBusqueda(busqueda);
	actualizarVisibleDirectorio(academicosFiltradosPorLinea);
	renderFrase(academicosFiltradosPorLinea);
	partirDirectorio(academicosFiltradosPorLinea);
}

function mostrarBusqueda(params){
	var pars = "";
	if(typeof params === 'object') pars = params.join(", ");
	else pars = params;
	document.getElementById("frase-linea").innerHTML = "Resultados de búsqueda: <span class='vino'>" + pars + "</span>";
	document.getElementById("filete-top").style.borderTopColor = "#7E3355";
	document.getElementById("filete-top").style.borderTopWidth = "3px";
	document.getElementById("filete-top").style.borderTopStyle = "solid";
}

function renderFrase(arreglo){
	uno_visible = false;
	var borrar_frase = (document.getElementById("frase-desc") != null && arreglo.length > 0);
	for(var i = 0; i < docentes.length; i++){
		if(docentes[i]["visible"]){
			uno_visible = true;
			break;
		}
	}
	if(!uno_visible){
		setTimeout(function(){
			$("#frase-desc").remove();
			$("#busqueda").append("<div id=\"frase-desc\">Ningún contenido coincide con su búsqueda.</div>");}, 50);
	}	
	else{
		$("#frase-desc").remove();
	}
}

function actualizarVisibleDirectorio(visibles){
	total = 0;
	for(var i = 0; i < docentes.length; i++){
		docentes[i]["visible"] = false;
		docentes[i]["vista"] = -1;
		$("#doc-"+i).attr("class","uk-accordion-title");
	}
	for(var i = 0; i < visibles.length; i++){
		docentes[visibles[i]["index"]]["visible"] = true;
		docentes[visibles[i]["index"]]["vista"] = Math.floor(i/15);
		$("#doc-"+visibles[i]["index"]).attr("class","uk-accordion-title view-"+visibles[i]["index"]);
		total = total + 1;
	}
	reescalarDirectorio();
}

function muestra(pag){
	var i;
	var accordion = UIkit.accordion(UIkit.$('#acordeon'));
	accordion.find('[data-wrapper]').each(function(){
		if(UIkit.$(this)[0].firstElementChild.className.indexOf("uk-active") != -1){
			accordion.toggleItem(UIkit.$(this), true, true); 
		}
	});
	$("#sep-ant").css({"display": "inline-block"});
	$("#sep-sig").css({"display": "inline-block"});

	if(vistas <= 0){
		$("#sep-ant").css({"cursor": "default", "display": "none"});
		$("#sep-sig").css({"cursor": "default", "display": "none"});
		$("#sep-0").css({"color": "#993366"});
		vista_act = 0;
	}

	else if(pag == "ant"){
		vista_act = vista_act - 1;

		$("#sep-ant").css({"cursor": "pointer"});
		$("#sep-sig").css({"cursor": "pointer"});
		if(vista_act < 1){
			vista_act = 0;
			$("#sep-ant").css({"cursor": "default"});
		}
	}

	else if(pag == "sig"){
		vista_act = vista_act + 1;

		$("#sep-ant").css({"cursor": "pointer"});
		$("#sep-sig").css({"cursor": "pointer"});
		if(vista_act > vistas - 1){
			vista_act = vistas;
			$("#sep-sig").css({"cursor": "default"});
		}
	}

	else{
		if(+pag == 0){
			$("#sep-ant").css({"cursor": "default"});
			$("#sep-sig").css({"cursor": "pointer"});
		}
		else if(+pag == vistas){
			$("#sep-ant").css({"cursor": "pointer"});
			$("#sep-sig").css({"cursor": "default"});
		}
		else{
			$("#sep-ant").css({"cursor": "pointer"});
			$("#sep-sig").css({"cursor": "pointer"});
		}
		vista_act = +pag;
	}

	for(i=0; i<=vistas; i++){
		$("#sep-"+i).css({"color":"#909090"});
	}

	for(i=0;i<docentes.length;i++){
		$("#doc-"+i).css({"display": (docentes[i]["vista"] == vista_act ? "block" : "none")});
	}
	
	$("#sep-"+vista_act).css({"color": "#993366"});
}

function borrarDocentes(event){
	var accordion = UIkit.accordion(UIkit.$('#acordeon'));
	accordion.find('[data-wrapper]').each(function(){
		if(UIkit.$(this)[0].firstElementChild.className.indexOf("uk-active") != -1){
			accordion.toggleItem(UIkit.$(this), true, true); 
		}
	});
	$("#nombre").val("");
	//$("#correo").val("");
	$("#linea").val("");
	$("#contenido").val("");
	for(var i = 0; i < docentes.length; i++){
		$("#doc-"+i).css({"display": "none"});
	}
	$("#separadores").html("");
	$(".inics.letra").css({"color" : "#909090"});
	$("#frase-desc").remove();
	$("#frase-linea").html("");
	$("#filete-top").css({"border":"none"});
	event.preventDefault();
}

function reescalarDirectorio(){
	for(var i = 0; i < docentes.length; i++){
		$("#doc-"+i).css({"display": (docentes[i]["visible"] ? "block" : "none")/*, "width" : (descubres[i]["visible"] ? "" : 0), "border" : (descubres[i]["visible"] ? "solid 4px #fff" : "none") */});
	}
}

function limpiarPuntuacion(tags){
	var new_tags = tags.replace(/[íïîìÍÏÎÌ]/gi,"i");
	new_tags = new_tags.replace(/[áäâàÁÄÂÀ]/gi,"a");
	new_tags = new_tags.replace(/[éëêèÉËÊÈ]/gi,"e");
	new_tags = new_tags.replace(/[óöôòÓÖÔÒ]/gi,"o");
	new_tags = new_tags.replace(/[úüûùÚÜÛÙ]/gi,"u");
	return new_tags;
}

function agregarVisible(doc){
	for(var i = 0; i < doc.length; i++){
		doc[i]["visible"] = false;
		doc[i]["index"] = i;
		doc[i]["vista"] = -1;
	}
}

function clone(obj) {
    var copy;

    // Handle the 3 simple types, and null or undefined
    if (null == obj || "object" != typeof obj) return obj;

    // Handle Date
    if (obj instanceof Date) {
        copy = new Date();
        copy.setTime(obj.getTime());
        return copy;
    }

    // Handle Array
    if (obj instanceof Array) {
        copy = [];
        for (var i = 0, len = obj.length; i < len; i++) {
            copy[i] = clone(obj[i]);
        }
        return copy;
    }

    // Handle Object
    if (obj instanceof Object) {
        copy = {};
        for (var attr in obj) {
            if (obj.hasOwnProperty(attr)) copy[attr] = clone(obj[attr]);
        }
        return copy;
    }

    throw new Error("Unable to copy obj! Its type isn't supported.");
}

