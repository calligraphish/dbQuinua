void ingresar() {
  background(morado_oscuro);
  pushStyle();
  imageMode(CORNER); 
  icon(bx6, by6, boxSizeH, overHome, home2, amarillo, beige, "", lgnFont);
  icon(bx7, by7, boxSizeH, overLogOut, back, amarillo, beige, "", lgnFont);
  if (runOnce) {

    runOnce = false;
  }
  textFont(lgnFont);
  fill(255);
  textFont(lgnFont);
  textAlign(CENTER);
  text("Ingresar Cliente", width/2, 100);

  popStyle();
}