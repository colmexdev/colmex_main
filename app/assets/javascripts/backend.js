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

function renderRecords(link){
	
/*	$.ajax({
		url: link,
		dataType: 'JSON',
		method: 'GET',
		success: function(result){
			var tabla = $("#index-panel tbody");
			var record = "";
			console.log(result);
			tabla.html("");
			for(var i = 0; i < result.length; i++){
				
			}
		}
	});
*/
}

function readURL(input,display,file) {
  if (input.files && input.files[0]) {
		console.log(input.files);
		window.archivo = input.files;
    var reader = new FileReader();
    
    reader.onload = function (e) {
				if(file != null ){
        	$(display).attr('src', e.target.result);
				}
				else{
					$(display).attr('src', e.target.result);
				}
    }
    
    reader.readAsDataURL(input.files[0]);
  }
}

function formatDate(fecha){
	var months = ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre']
	var day = fecha.getDate(), month = fecha.getMonth();
	return months[month] + " " + padZero(day) /*padZero(month)*/
}

function padZero(n){
	return (n < 10 ? "0" + n : n.toString())
}

/* Funciones de graficación */

function modifyTooltip(sheet,left){
	if(sheet.rules.length == 1){
		sheet.removeRule(0);
	}
	sheet.insertRule('#tooltip-backend::after { left: ' + left + 'px }',0);
}

function escala(tipo,dom,rango,pad){
	var scale = (tipo == 't' ? d3.scaleTime() : (tipo == 'l' ? d3.scaleLinear() : d3.scaleBand()));
	if(tipo == "b") scale = scale.paddingInner(pad[0]).paddingOuter(pad[1]);
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

function completaFechas(f_i,f_f,only){
	only = only || false;
	var fs = [];
	var dif_dias = Math.ceil((f_f-f_i)/(24000*3600));
	for(var i=0; i<dif_dias; i++){
		if(!only)
			fs.push({key: new Date(f_i.getTime()+(i*24000*3600)), value: 0});
		else
			fs.push(new Date(f_i.getTime()+(i*24000*3600)));
	}
	return fs
}

function containerSelect(cont_id,cont_props){
	var c = d3.select(cont_id);
	for(var k in cont_props){
		if(cont_props.hasOwnProperty(k)){
			c = c.style(k,cont_props[k]);
		}
	}
	return c;
}

function traceFigures(canvas,d_set,fig_class,figure,fig_props,sc_x,sc_y,styles,delegs){
	styles = styles || null;
	delegs = delegs || null;
	var figs = d3.select(canvas).selectAll("."+fig_class)
		.data(d_set)
		.enter().append(figure);

	for(var k in fig_props){
		if(fig_props.hasOwnProperty(k)){
			figs = figs.attr(k,fig_props[k]);
		}
	}

	if(styles != null){
		for(var k in styles){
			if(styles.hasOwnProperty(k)){
				figs = figs.style(k,styles[k]);
			}
		}
	}

	if(delegs != null){
		for(var k in delegs){
			if(delegs.hasOwnProperty(k)){
				figs = figs.on(k,delegs[k]);
			}
		}
	}
}

function adjustLabels(){
	d3.selectAll(".axis-left .tick text").attr("x","-7");
	d3.selectAll(".axis-right .tick text").attr("x","7");
	d3.selectAll(".axis-top .tick text").attr("y","-10");
	d3.selectAll(".axis-bottom .tick text").attr("y","8");
}

// 0 : Fecha; 1: Número; Default other
function linea(sc_x,sc_y,inter,typeX,typeY,area,y0){
	area = area || false
	var fig = (area ? d3.area() : d3.line());
		fig = fig.x(function(d){return sc_x((typeX == 0 ? new Date(d.key) : (typeX == 1 ? +d.key : d.key)))}).curve(inter);
		fig = (area ? fig.y1(function(d){return sc_y((typeY == 0 ? new Date(d.value) : (typeY == 1 ? +d.value : d.value)))}) : fig.y(function(d){return sc_y((typeY == 0 ? new Date(d.value) : (typeY == 1 ? +d.value : d.value)))}) );
		

	return (area ? fig.y0(y0) : fig);
}

function pieChart(div_cont,cont_props,canvas,corners,c_id,radii,pads,sect_class,d_set,delegs){
	var cont = containerSelect(div_cont,cont_props);
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
			.attr("id",function(d,i){ return sect_class+"-"+i})
			.append("path")
			.attr("d",arc);

	for(var k in delegs){
		p_c = p_c.on(k,delegs[k]);
	}
}
