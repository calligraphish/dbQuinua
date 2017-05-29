void clientes() {
  background(morado_oscuro);
  pushStyle();
  imageMode(CORNER); 
  icon(bx6, by6, boxSizeH, overHome, home2, amarillo, beige, "", lgnFont);
<<<<<<< HEAD
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
=======
  icon(bx8, by8, boxSizeH, overAdd, add, amarillo, beige, "", lgnFont);
   if (runOnce) {
      Box21.addItem("NOMBRE_DE_EMPRESA");
      Box22.addItem("TIPO_DE_EMPRESA");
      Box23.addItem("REPRESENTANTE_LEGAL");
      Box24.addItem("TELEFONO");
      msql.query("SELECT * FROM ESTABLECIMIENTO_V;");
      while (msql.next())
      {
            String NOMBRE_DE_EMPRESA = msql.getString("NOMBRE_DE_EMPRESA");
            String TIPO_DE_EMPRESA = msql.getString("TIPO_DE_EMPRESA");
            String REPRESENTANTE_LEGAL = msql.getString("REPRESENTANTE_LEGAL");
            String TELEFONO = msql.getString("TELEFONO");
        Box21.addItem(NOMBRE_DE_EMPRESA);
        Box22.addItem(TIPO_DE_EMPRESA);
        Box23.addItem(REPRESENTANTE_LEGAL);
        Box24.addItem(TELEFONO);
      }
    box1.setX(237);//PRIMERO SE COLOCA LA X INICIAL QUE AFECTA A LAS DEMAS
    runOnce = false;
    }
  Box21.draw();
  Box22.draw();
  Box23.draw();
  Box24.draw();
  Box21.setX(box1.getWidth()+box1.getX());//PATRÓN DESPUÉS DEL DRAW.
  Box22.setX(Box2.getWidth()+Box2.getX());
  Box23.setX(Box3.getWidth()+Box3.getX());
  Box24.setX(Box3.getWidth()+Box3.getX());
  pushStyle();
  textAlign(CENTER);
  textFont(lgnFont);
  text("Inventario", width/2, 100);
>>>>>>> c03b6839477bc3a721a2fbe91ee1b4a7f445734d
  popStyle();
}