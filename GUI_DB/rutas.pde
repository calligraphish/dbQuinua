void rutas() {
  background(morado_oscuro);
  pushStyle();
  imageMode(CORNER); 
  icon(bx6, by6, boxSizeH, overHome, home2, amarillo, beige, "", lgnFont);
  if (runOnce&&(user.equals("raul"))) {
    Box5.addItem("REPARTIDOR");
    Box6.addItem("CLIENTE");
    Box7.addItem("DIRECCION");

    msql.query( "SELECT * FROM vw_rutarepartidor" );

    while (msql.next()) {
      String repartidor = msql.getString("REPARTIDOR");
      String ruta = msql.getString("CLIENTE");
      String direccion = msql.getString("DIRECCION");
      Box5.addItem(repartidor);
      Box6.addItem(ruta);
      Box7.addItem(direccion);
    }
    runOnce = false;
  } else if (runOnce && (user.equals("root")||user.equals("admon"))) {
    Box25.addItem("FECHA");
    Box26.addItem("REPARTIDOR");
    Box27.addItem("COSTO ENVIO");
    Box28.addItem("ENTREGADO");
    msql.query( "SELECT * FROM vw_rutas_hist" );

    while (msql.next()) {
      String fecha = msql.getString("FECHA");
      String repartidor = msql.getString("REPARTIDOR");
      String costo_envio = msql.getString("COSTO_ENVIO");
      String entregado = msql.getString("ENTREGADO");
      Box25.addItem(fecha);
      Box26.addItem(repartidor);
      Box27.addItem(costo_envio);
      Box28.addItem(entregado);
    }
    runOnce = false;
  }
  if (user.equals("raul")) {
    pushStyle();
    textAlign(CENTER);
    textFont(lgnFont);
    if (Box5.getItems().size()==1) {
      text("No hay rutas para hoy", width/2, 250);
    } else {
      Box5.setX((width-((Box7.getX()+Box7.getWidth())-Box5.getX()))/2);//ESTA LINEA CENTRA AUTOMATICAMENTE TODO
      Box5.draw();
      Box6.draw();
      Box7.draw();
      Box6.setX(Box5.getWidth()+Box5.getX());
      Box7.setX(Box6.getWidth()+Box6.getX());
      text("Las rutas para "+day()+"-"+month()+"-"+year()+" son:", width/2, 250);
    }
    popStyle();
  } else if (user.equals("root")||user.equals("admon")) {
    Box25.setX((width-((Box28.getX()+Box28.getWidth())-Box25.getX()))/2);//ESTA LINEA CENTRA AUTOMATICAMENTE TODO
    Box25.draw();
    Box26.draw();
    Box27.draw();
    Box28.draw();
    Box26.setX(Box25.getWidth()+Box25.getX());
    Box27.setX(Box26.getWidth()+Box26.getX());
    Box28.setX(Box27.getWidth()+Box27.getX());
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
  popStyle();
}