function cambiarClasesIdioma(){
	this.style.color="#993366";
	if(this.id=="idioma_en"){
		document.getElementById("idioma_sp").style.color="#C0C0C0";
	}
	else{
		document.getElementById("idioma_en").style.color="#C0C0C0";
	}
	return false;
}
