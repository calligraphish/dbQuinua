void welcome() {
  noStroke();
  background(beige);
  pushMatrix();
  pushStyle();
  fill(amarillo);
  translate(width/2, height/2);
  beginShape();
  for (float theta = 0; theta <= 2*PI; theta +=0.01) {
    float rad = r(theta, 5, 5, 1, 1, abs(sin(var)+2), abs(sin(var)+2));
    float x = rad*cos(theta)*4.0;
    float y = rad*sin(theta)*4.0;
    vertex(x, y);
    rotate(var);
  }
  endShape();

  var += 0.03;
  popMatrix();
  popStyle();

  pushStyle();
  pushMatrix();
  translate(width/2, height/2);
  textAlign(CENTER);
  textFont(lgnFont);
  fill(sin(var)*255);
  text("Bienvenido", 0, 150);
  popStyle();
  popMatrix();
}

float r(float theta, float a, float b, float m, float n1, float n2, float n3) {
  return pow(pow(abs(cos(m*theta/4.0)/a), n2) + pow(abs(sin(m*theta/4.0)/b), n3), -1.0/n1);
}