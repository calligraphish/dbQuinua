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
  textSize(15);
  text("Nombre del establecimiento", width/5, height/2-60); 
  text("Tipo de establecimiento", width/5, height/2-10);
  text("Nombre del representante", width/5, height/2+40); 
  text("Teléfono representante", width/5, height/2+90);
  text("Dirección", width/5, height/2+140); 
  text("Teléfono cliente", width/5, height/2+190); 
  popStyle();
}