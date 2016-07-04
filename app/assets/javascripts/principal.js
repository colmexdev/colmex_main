

function borrarClase(element){
  dropdown1 = document.getElementById("dropdown1");
  dropdown2 = document.getElementById("dropdown2");
  dropdown3 = document.getElementById("dropdown3");
  if(element.id == "dropdown1"){
    document.getElementById("dropdown2").removeclass("open");
    document.getElementById("dropdown3").removeclass("open");
  }
  else if(element.id == "dropdown2"){
    document.getElementById("dropdown1").removeclass("open");
    document.getElementById("dropdown3").removeclass("open");
  }
  else if(element.id == "dropdown3"){
    document.getElementById("dropdown2").removeclass("open");
    document.getElementById("dropdown1").removeclass("open");
  }
  this.addClass("open");
  
}
