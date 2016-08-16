function ocultarTipoCurso(){
	if(document.getElementById("curso_programa").value.toUpperCase() != "CURSO")
	{
		document.getElementById("tipo_curso").style.display = "none";
		document.getElementById("tipo_c_linea").style.display = "none";
	}
	else
	{
		document.getElementById("tipo_curso").style.display = "block";
		document.getElementById("tipo_c_linea").style.display = "block";
	}
}
