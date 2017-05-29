void compra() {
  defaultLook.baseColor = beige;
  defaultLook.borderColor = beige;
  defaultLook.selectionColor = aguamarina;
  defaultLook.highlightColor = naranja;
  defaultLook.activeColor = amarillo;
  defaultLook.textColor = color(0);
  defaultLook.lightGrayColor = naranja;
  defaultLook.darkGrayColor = azul;
  background(morado_oscuro);
  pushStyle();
  imageMode(CORNER); 
  icon(bx6, by6, boxSizeH, overHome, home2, amarillo, beige, "", lgnFont);
  icon(bx7, by7, boxSizeH, overLogOut, back, amarillo, beige, "", lgnFont);
  icon(bx9, by9, boxSizeC, overCommit, commit, color(0,255,0), color(255), "", lgnFont);
  if (runOnce) {
    c3.setVisible(true);
    runOnce = false;
  }
  textFont(lgnFont);
  fill(255);
  textFont(lgnFont);
  textAlign(CENTER);
  text("Ingresar venta", width/2, 100);
  textAlign(LEFT);
  text("Ingrese ID cliente", width/7, height/2-70); 
  text("ID de sede", width/7, height/2+30);
  text("ID de venta", width/7, height/2+130); 
  text("ID de empleado", width/7, height/2+230); 
  popStyle();
}