miembros = clone(JSON.parse(gon.miembros));
agregarVisible(miembros);
data = crossfilter(miembros);
miembrosPorNombre = data.dimension(function(d){ return d["nombre"]});
miembrosPorCentro = data.dimension(function(d){ return d["centro"]});
miembrosPorRol = data.dimension(function(d){ return d["roles"]});
miembrosPorInicial = data.dimension(function(d){ return d["inicial"]});
vistas = 0;
total = 0;
vista_act = 0;

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


function filtrarDirectorio(b = '0'){
	/*var accordion = UIkit.accordion(UIkit.$('#acordeon'));
	accordion.find('[data-wrapper]').each(function(){
		if(UIkit.$(this)[0].firstElementChild.className.indexOf("uk-active") != -1){
			accordion.toggleItem(UIkit.$(this), true, true); 
		}
	});*/
	miembrosPorNombre.filterAll();
	miembrosPorCentro.filterAll();
	miembrosPorRol.filterAll();
	miembrosPorInicial.filterAll();
	var busqueda = [];
	if(b != '0'){
		$("#nombre").val("");
		$("#rol").val("");
		$("#centro").val("");
		busqueda = b;
	}
	var centrosAFiltrar = $("#centro").val();
	var nombresAFiltrar = limpiarPuntuacion($("#nombre").val().toLowerCase()).split(/[ ]+/);
	var rolesAFiltrar = $("#rol").val()

	if(b == '0'){
		if($("#centro").val() != "") busqueda.push("(Centro: " + $("#centro").val() + ")");
		if($("#nombre").val() != "") busqueda.push("(Nombre: " + $("#nombre").val() + ")");
		if($("#rol").val() != "") busqueda.push("(Tipo: " + $("#rol").val() + ")");
	}

	var miembrosFiltradosPorCentro = miembrosPorCentro.filter(function(d){ return ( (b != '0' || centrosAFiltrar == "") ? true : d == centrosAFiltrar )}).top(Infinity);
	var miembrosFiltradosPorNombre = miembrosPorNombre.filter(function(d){
		if(b != '0' || nombresAFiltrar == []) return true;
		var nombre = limpiarPuntuacion(d.toLowerCase()); 
		for(var j = 0; j < nombresAFiltrar.length; j++){
			if(nombre.indexOf(nombresAFiltrar[j]) == -1) return false;
		}
		return true;
	//return (nombresAFiltrar == "" ? true :limpiarPuntuacion(d.toLowerCase()).indexOf(nombresAFiltrar.toLowerCase()) != -1)
	}).top(Infinity);
	var miembrosFiltradosPorInicial = miembrosPorInicial.filter(function(d){ return (b == '0' ? true : d == b)}).top(Infinity);

	/*var miembrosFiltradosPorRol = miembrosPorRol.filter(function(d){ 
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
	}).top(Infinity);*/
	var miembrosFiltradosPorRol = miembrosPorRol.filter(function(d){ return ( (b != '0' || rolesAFiltrar == "") ? true : d == rolesAFiltrar )}).top(Infinity);
	vista_act = 0;
	$(".inics").css({"color" : "#909090"});
	if(typeof b !== 'object' && b != '0'){
		$("#inic_"+b).css({"color" : "#993366"});
	}

	mostrarBusqueda(busqueda);
	actualizarVisibleDirectorio(miembrosFiltradosPorRol);
	renderFrase(miembrosFiltradosPorRol);
	partirDirectorio(miembrosFiltradosPorRol);
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
	for(var i = 0; i < miembros.length; i++){
		if(miembros[i]["visible"]){
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
	for(var i = 0; i < miembros.length; i++){
		miembros[i]["visible"] = false;
		miembros[i]["vista"] = -1;
		$("#mem-"+i).attr("class","miembro");
	}
	for(var i = 0; i < visibles.length; i++){
		miembros[visibles[i]["index"]]["visible"] = true;
		miembros[visibles[i]["index"]]["vista"] = Math.floor(i/15);
		$("#mem-"+visibles[i]["index"]).attr("class","miembro view-"+visibles[i]["index"]);
		total = total + 1;
	}
	reescalarDirectorio();
}

function muestra(pag){
	var i;
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

	for(i=0;i<miembros.length;i++){
		$("#mem-"+i).css({"display": (miembros[i]["vista"] == vista_act ? "block" : "none")});
	}
	
	$("#sep-"+vista_act).css({"color": "#993366"});
}

function borrarDocentes(){
	/*var accordion = UIkit.accordion(UIkit.$('#acordeon'));
	accordion.find('[data-wrapper]').each(function(){
		if(UIkit.$(this)[0].firstElementChild.className.indexOf("uk-active") != -1){
			accordion.toggleItem(UIkit.$(this), true, true); 
		}
	});*/
	$("#nombre").val("");
	$("#centro").val("");
	$("#rol").val("");
	for(var i = 0; i < miembros.length; i++){
		$("#mem-"+i).css({"display": "none"});
	}
	$("#separadores").html("");
	$(".inics.letra").css({"color" : "#909090"});
	$("#frase-desc").remove();
	$("#frase-linea").html("");
	$("#filete-top").css({"border":"none"});
	event.preventDefault();
}

function reescalarDirectorio(){
	for(var i = 0; i < miembros.length; i++){
		$("#mem-"+i).css({"display": (miembros[i]["visible"] ? "block" : "none")/*, "width" : (descubres[i]["visible"] ? "" : 0), "border" : (descubres[i]["visible"] ? "solid 4px #fff" : "none") */});
	}
}

function limpiarPuntuacion(tags){
	var new_tags = tags.replace(/[íïîì]/i,"i");
	new_tags = new_tags.replace(/[áäâà]/i,"a");
	new_tags = new_tags.replace(/[éëêè]/i,"e");
	new_tags = new_tags.replace(/[óöôò]/i,"o");
	new_tags = new_tags.replace(/[úüûù]/i,"u");
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
