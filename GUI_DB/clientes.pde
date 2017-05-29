void clientes() {
  background(morado_oscuro);
  pushStyle();
  imageMode(CORNER); 
  icon(bx6, by6, boxSizeH, overHome, home2, amarillo, beige, "", lgnFont);
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
  popStyle();
}