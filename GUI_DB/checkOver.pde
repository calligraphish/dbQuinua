void checkOver() {
  if (mouseX > bx2-boxSize && mouseX < bx2+boxSize && mouseY > by2-boxSize && mouseY < by2+boxSize) {
    overInventario=true;
    //println("Is over INVENTARIO");
  } else {
    overInventario=false;
  }
  if (mouseX > bx3-boxSize && mouseX < bx3+boxSize && mouseY > by3-boxSize && mouseY < by3+boxSize) {
    overRutas=true;
    //println("Is over RUTAS");
  } else {
    overRutas=false;
  }
  if (mouseX > bx4-boxSize && mouseX < bx4+boxSize && mouseY > by4-boxSize && mouseY < by4+boxSize) {
    overClientes=true;
    //println("Is over CLIENTES");
  } else {
    overClientes=false;
  }
  if (mouseX > bx5-boxSize && mouseX < bx5+boxSize && mouseY > by5-boxSize && mouseY < by5+boxSize) {
    overVentas=true;
    //println("Is over VENTAS");
  } else {
    overVentas=false;
  }
  if (mouseX > bx6-boxSizeH && mouseX < bx6+boxSizeH && mouseY > by6-boxSizeH && mouseY < by6+boxSizeH) {
    overHome=true;
    //println("Is over HOME");
  } else {
    overHome=false;
  }
  if (mouseX > bx7-boxSizeLO && mouseX < bx7+boxSizeLO && mouseY > by7-boxSizeLO && mouseY < by7+boxSizeLO) {
    overLogOut=true;
    //println("Is over HOME");
  } else {
    overLogOut=false;
  }
  if (mouseX > bx8-boxSizeH && mouseX < bx8+boxSizeH && mouseY > by8-boxSizeH && mouseY < by8+boxSizeH) {
    overAdd=true;
    //println("Is over HOME");
  } else {
    overAdd=false;
  }
<<<<<<< HEAD
  
=======
>>>>>>> c03b6839477bc3a721a2fbe91ee1b4a7f445734d
}