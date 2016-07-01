function ocultarAnio(){
	if(["ESTATUTO","TRANSPARENCIA"].indexOf(document.getElementById("documento_tipo").value.toUpperCase()) != -1)
	{
		document.getElementById("campo_anio").style.display = "none";
	}
	else
	{
		document.getElementById("campo_anio").style.display = "block";
	}
}
