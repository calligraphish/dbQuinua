void rutas() {
  background(morado_oscuro);
  pushStyle();
  imageMode(CORNER); 
  icon(bx6, by6, boxSizeH, overHome, home2, amarillo, beige, "", lgnFont);
  if (runOnce) {
    Box5.addItem("REPARTIDOR");
    Box6.addItem("CLIENTE");
    Box7.addItem("DIRECCION");

    msql.query( "SELECT * FROM vw_rutarepartidor" );

    while (msql.next())
    {
      String repartidor = msql.getString("REPARTIDOR");
      String ruta = msql.getString("CLIENTE");
      String direccion = msql.getString("DIRECCION");
      Box5.addItem(repartidor);
      Box6.addItem(ruta);
      Box7.addItem(direccion);
    }
    runOnce = false;
  }
  if (!(Box5.getItems().size()==1)) {
    Box5.setX((width-((Box7.getX()+Box7.getWidth())-Box5.getX()))/2);//ESTA LINEA CENTRA AUTOMATICAMENTE TODO
    Box5.draw();
    Box6.draw();
    Box7.draw();
    Box6.setX(Box5.getWidth()+Box5.getX());
    Box7.setX(Box6.getWidth()+Box6.getX());
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
  text("Rutas", width/2, 100);
  text("Las rutas para "+day()+"-"+month()+"-"+year()+" son:", width/2, 250);
  popStyle();
}