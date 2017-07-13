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

function readURL(input,display,file) {
  if (input.files && input.files[0]) {
		console.log(input.files);
    var reader = new FileReader();
    
    reader.onload = function (e) {
				if(file != null ){
        	$(display).attr('src', e.target.result);
				}
				else{
					$(display).attr('href', e.target.result);
				}
    }
    
    reader.readAsDataURL(input.files[0]);
  }
}

/* Funciones de graficación */

function escala(tipo,dom,rango){
	var scale = (tipo == 't' ? d3.scaleTime() : d3.scaleLinear());
	return scale
				.domain(dom)
				.range(rango)
}

function eje(o,escala,n_ticks,s_ticks,p_ticks,f_ticks){
	f_ticks = f_ticks || null;
	p_ticks = p_ticks || null;
	n_ticks = n_ticks || 10;
	s_ticks = s_ticks || null;
	var axis = (o == 'b' ? d3.axisBottom(escala) : d3.axisLeft(escala));
	return axis
					.ticks(n_ticks)
					.tickSize(s_ticks)
					.tickPadding(p_ticks)
					.tickFormat(f_ticks)
}

function completaFechas(f_i,f_f){
	var fs = [];
	var dif_dias = Math.ceil((f_f-f_i)/(24000*3600));
	for(var i=0; i<dif_dias; i++){
		fs.push({key: new Date(f_i.getTime()+(i*24000*3600)), value: 0});
	}
	return fs
}

function traceFigures(canvas,d_set,fig_class,figure,fig_props,sc_x,sc_y){
	var figs = d3.select(canvas).selectAll("."+fig_class)
		.data(d_set)
		.enter().append(figure);

	for(var k in fig_props){
		if(fig_props.hasOwnProperty(k)){
			figs = figs.attr(k,fig_props[k]);
		}
	}
}

// 0 : Fecha; 1: Número; Default other
function linea(sc_x,sc_y,inter,typeX,typeY){
	var line = d3.line()
		.x(function(d){return sc_x((typeX == 0 ? new Date(d.key) : (typeX == 1 ? +d.key : d.key)))})
		.y(function(d){return sc_y((typeY == 0 ? new Date(d.value) : (typeY == 1 ? +d.value : d.value)))})
		.curve(inter);
}

function pieChart(div_cont,cont_props,canvas,corners,c_id,radii,pads,sect_class,d_set){
	var cont = d3.select(div_cont);

	for(var k in cont_props){
		if(cont_props.hasOwnProperty(k)){
			cont = cont.style(k,cont_props[k]);
		}
	}

	var svg_p = cont.select(canvas)
 		.attr("preserveAspectRatio", "xMinYMin meet")
		.attr("viewBox", "0 0 "+corners[0]+" "+corners[1])
		.append("g")
		.attr("id",c_id)
		.attr("transform","translate("+(corners[0]/2)+","+(corners[1]/2)+")");

	var arc = d3.arc()
			.outerRadius(radii[1])
			.innerRadius(radii[0])
			.padAngle(pads[0])
			.padRadius(pads[1]);

	/*var labelArc = d3.arc()
			.outerRadius(radius - 40)
			.innerRadius(radius - 40);*/

	var pie = d3.pie()
			.sort(null)
			.value(function(d) { return d.value; });

	var p_c = svg_p.selectAll("."+sect_class)
			.data(pie(d_set))
			.enter().append("g")
			.attr("class",sect_class)
			.append("path")
			.attr("d",arc);
}
