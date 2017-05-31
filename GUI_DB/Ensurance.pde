void sure() {
  pushStyle();
  background(rojo);
  textFont(lgnFont);
  textSize(40);
  textAlign(CENTER);
  fill(beige);
  text("¿Está seguro que desea salir?", width/2, height/2);
  rectMode(RADIUS);
  textSize(90);
  if (overYes) {
    fill(255);
  } else {
    fill(0);
  }

  text("Sí", width/4, height/2+90);
  if (overNo) {
    fill(255);
  } else {
    fill(0);
  }
  text("No", 3*width/4, height/2+90);
  popStyle();
}