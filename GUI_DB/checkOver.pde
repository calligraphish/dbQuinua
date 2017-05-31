void checkOver() {
  if (mouseX > bx2-boxSize && mouseX < bx2+boxSize && mouseY > by2-boxSize && mouseY < by2+boxSize) {
    overInventario=true;

  } else {
    overInventario=false;
  }
  if (mouseX > bx3-boxSize && mouseX < bx3+boxSize && mouseY > by3-boxSize && mouseY < by3+boxSize) {
    overRutas=true;

  } else {
    overRutas=false;
  }
  if (mouseX > bx4-boxSize && mouseX < bx4+boxSize && mouseY > by4-boxSize && mouseY < by4+boxSize) {
    overClientes=true;

  } else {
    overClientes=false;
  }
  if (mouseX > bx5-boxSize && mouseX < bx5+boxSize && mouseY > by5-boxSize && mouseY < by5+boxSize) {
    overVentas=true;

  } else {
    overVentas=false;
  }
  if (mouseX > bx6-boxSizeH && mouseX < bx6+boxSizeH && mouseY > by6-boxSizeH && mouseY < by6+boxSizeH) {
    overHome=true;
    
  } else {
    overHome=false;
  }
  if (mouseX > bx7-boxSizeLO && mouseX < bx7+boxSizeLO && mouseY > by7-boxSizeLO && mouseY < by7+boxSizeLO) {
    overLogOut=true;
    
  } else {
    overLogOut=false;
  }
  if (mouseX > bx8-boxSizeH && mouseX < bx8+boxSizeH && mouseY > by8-boxSizeH && mouseY < by8+boxSizeH) {
    overAdd=true;
      
  } else {
    overAdd=false;
  }
  if (mouseX > bx9-boxSizeC && mouseX < bx9+boxSizeC && mouseY > by9-boxSizeC && mouseY < by9+boxSizeC) {
    overCommit=true;
      
  } else {
    overCommit=false;
  }
    if (mouseX > width/4-100 && mouseX < width/4+100 && mouseY > height/2+50-50 && mouseY < height/2+50+50) {
    overYes=true;
  } else {
    overYes=false;
  }
  if (mouseX > 3*width/4-100 && mouseX < 3*width/4+100 && mouseY > height/2+50-50 && mouseY < height/2+50+50) {
    overNo=true;
  } else {
    overNo=false;
  }


}