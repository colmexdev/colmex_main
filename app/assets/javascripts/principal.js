function cambiarClasesIdioma(){
	this.style.color="#993366";
	if(this.id=="idioma_en"){
		document.getElementById("idioma_sp").color="#C0C0C0";
	}
	else{
		document.getElementById("idioma_en").color="#C0C0C0";
	}
	return false;
}
