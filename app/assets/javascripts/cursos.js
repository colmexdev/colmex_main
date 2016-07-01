function ocultarTipoCurso(){
	if(document.getElementById("curso_programa").value.toUpperCase() != "CURSO")
	{
		document.getElementById("tipo_curso").style.visibility = "hidden";
	}
	else
	{
		document.getElementById("tipo_curso").style.visibility = "visible";
	}
}
