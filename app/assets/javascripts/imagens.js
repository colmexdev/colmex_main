function ocultarCategoria(){
	if(document.getElementById("imagen_galeria").value.toUpperCase() != "PREMIOS")
	{
		document.getElementById("campo_categoria").style.display = "none";
	}
	else
	{
		document.getElementById("campo_categoria").style.display = "block";
	}
}
