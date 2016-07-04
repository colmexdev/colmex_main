function cambiarClasesIdioma(link){
	link.style.color="#993366";
	if(link.id=="idioma_en"){
		document.getElementById("idioma_sp").style.color="#C0C0C0";
	}
	else{
		document.getElementById("idioma_en").style.color="#C0C0C0";
	}
	return false;
}

function borrarClase(){
  dropdown1 = document.getElementById("dropdown1");
  dropdown2 = document.getElementById("dropdown2");
  dropdown3 = document.getElementById("dropdown3");
  console.log(this.id);
  
}
