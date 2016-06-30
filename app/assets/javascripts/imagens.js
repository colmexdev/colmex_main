function ocultarCategoria(){
	if(this.value.toUpperCase() != "PREMIOS")
	{
		document.getElementById("campo_categoria").style.visibility = "hidden";
	}
	else
	{
		document.getElementById("campo_categoria").style.visibility = "visible";
	}
}
