function ocultarCategoria(){
	if(document.getElementById("imagen_galeria").value.toUpperCase() != "PREMIOS")
	{
		document.getElementById("campo_categoria").style.visibility = "hidden";
	}
	else
	{
		document.getElementById("campo_categoria").style.visibility = "visible";
	}
}
