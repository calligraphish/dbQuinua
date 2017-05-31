void ingresar() {
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
    c2.setVisible(true);
    runOnce = false;
  }
  textFont(lgnFont);
  fill(255);
  textFont(lgnFont);
  textAlign(CENTER);
  text("Ingresar Cliente", width/2, 100);
  textAlign(LEFT);
  text("Nombre", width/7, height/2-120); 
  text("Tipo de establecimiento", width/7, height/2-20);
  text("Nombre del representante", width/7, height/2+80); 
  text("Teléfono", width/7, height/2+180); 
  text("Dirección", width/7, height/2+280); 
  popStyle();
}