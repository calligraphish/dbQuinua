void clientes() {
  background(morado_oscuro);
  pushStyle();
  imageMode(CORNER); 
  icon(bx6, by6, boxSizeH, overHome, home2, amarillo, beige, "", lgnFont);
  icon(bx7, by7, boxSizeH, overAdd, add, amarillo, beige, "", lgnFont);
  if (runOnce5) {
    Box8.addItem("NOMBRE_DE_EMPRESA");
    Box9.addItem("TIPO_DE_EMPRESA");
    Box10.addItem("REPRESENTANTE_LEGAL");
    Box11.addItem("TELEFONO");
    msql.query("SELECT * FROM vw_clientes;");
    while (msql.next())
    {
      String NOMBRE_DE_EMPRESA = msql.getString("NOMBRE_DE_EMPRESA");
      String TIPO_DE_EMPRESA = msql.getString("TIPO_DE_EMPRESA");
      String REPRESENTANTE_LEGAL = msql.getString("REPRESENTANTE_LEGAL");
      String TELEFONO = msql.getString("TELEFONO");
      Box8.addItem(NOMBRE_DE_EMPRESA);
      Box9.addItem(TIPO_DE_EMPRESA);
      Box10.addItem(REPRESENTANTE_LEGAL);
      Box11.addItem(TELEFONO);
    }
    Box8.setX(40);
    runOnce5 = false;
  }
  Box8.draw();
  Box9.draw();
  Box10.draw();
  Box11.draw();
  Box9.setX(Box8.getWidth()+Box8.getX());
  Box10.setX(Box9.getWidth()+Box9.getX());
  Box11.setX(Box10.getWidth()+Box10.getX());
  textFont(lgnFont);
  fill(255);
  textFont(lgnFont);
  text("clientes", width/3, 100);
  textAlign(CENTER);
  popStyle();
}

void ingresar() {
  background(morado_oscuro);
  pushStyle();
  imageMode(CORNER); 
  icon(bx6, by6, boxSizeH, overHome, home2, amarillo, beige, "", lgnFont);
  icon(bx7, by7, boxSizeH, overAdd, back, amarillo, beige, "", lgnFont);
  if (runOnce) {

    runOnce = false;
  }
  textFont(lgnFont);
  fill(255);
  textFont(lgnFont);
  text("Ingresar Cliente", width/3, 100);
  textAlign(CENTER);
  popStyle();
}