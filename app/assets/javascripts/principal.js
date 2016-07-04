function borrarClase(element){
  dropdown1 = document.getElementById("dropdown1");
  dropdown2 = document.getElementById("dropdown2");
  dropdown3 = document.getElementById("dropdown3");
  if(element.id == "dropdown1"){
    dropdown2.className = "dropdown";
    dropdown3.className = "dropdown";
  }
  else if(element.id == "dropdown2"){
    dropdown1.className = "dropdown";
    dropdown3.className = "dropdown";
  }
  else if(element.id == "dropdown3"){
    dropdown1.className = "dropdown";
    dropdown2.className = "dropdown";
  }
  element.className = "dropdown open";
  
}

function quitarClases(){
  document.getElementById("dropdown1").className = "dropdown";
  document.getElementById("dropdown2").className = "dropdown";
  document.getElementById("dropdown3").className = "dropdown";
}
