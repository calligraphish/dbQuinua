void clientes() {
  background(morado_oscuro);
  pushStyle();
  imageMode(CORNER); 
  icon(bx6, by6, boxSizeH, overHome, home2, amarillo, beige, "", lgnFont);
  if (runOnce) {
    Box21.addItem("NOMBRE_DE_EMPRESA");
    Box22.addItem("TIPO_DE_EMPRESA");
    Box23.addItem("REPRESENTANTE_LEGAL");
    Box24.addItem("TELEFONO");
    msql.query("SELECT * FROM vw_clientes;");
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
    runOnce = false;
  }
  if (!(Box21.getItems().size()==1)) {
    Box21.draw();
    Box22.draw();
    Box23.draw();
    Box24.draw();
    Box22.setX(Box21.getWidth()+Box21.getX());
    Box23.setX(Box22.getWidth()+Box22.getX());
    Box24.setX(Box23.getWidth()+Box23.getX());
    Box21.setX((width-((Box24.getX()+Box24.getWidth())-Box21.getX()))/2);//ESTA LINEA CENTRA AUTOMATICAMENTE TODO
    icon(bx8, by8, boxSizeH, overAdd, add, amarillo, beige, "", lgnFont);
  } else {
    pushStyle();
    textAlign(CENTER);
    textFont(lgnFont);
    text("No tienes los permisos correctos.", width/2, height/2);
    popStyle();
  }
  pushStyle();
  textAlign(CENTER);
  textFont(lgnFont);
  text("Inventario", width/2, 100);
  popStyle();
}