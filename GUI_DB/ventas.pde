void ventas() {
  background(morado_oscuro);
  pushStyle();
  imageMode(CORNER); 
  icon(bx6, by6, boxSizeH, overHome, home2, amarillo, beige, "", lgnFont);
  if (runOnce) {
    Box15.addItem("ID_VENTA");
    Box16.addItem("FECHA");
    Box17.addItem("COSTO");
    Box18.addItem("NOMBRE");
    Box19.addItem("TELEFONO");
    Box20.addItem("DIRECCION");

    msql.query( "SELECT * FROM vw_ventas_admin;" );
    while (msql.next())
    {
      String ID_VENTA = msql.getString("ID_VENTA");
      String FECHA = msql.getString("FECHA");
      String COSTO_TOTAL = msql.getString("COSTO_TOTAL");
      String NOMBRE_CLIENTE = msql.getString("NOMBRE_CLIENTE");
      String TELEFONO_CLIENTE = msql.getString("TELEFONO_CLIENTE");
      String DIRECCION_CLIENTE = msql.getString("DIRECCION_CLIENTE");
      Box15.addItem(ID_VENTA);
      Box16.addItem(FECHA);
      Box17.addItem(COSTO_TOTAL);
      Box18.addItem(NOMBRE_CLIENTE);
      Box19.addItem(TELEFONO_CLIENTE);
      Box20.addItem(DIRECCION_CLIENTE);
    }
    runOnce = false;
  }
  if (!(Box15.getItems().size()==1)) {
    Box15.setX((width-((Box20.getX()+Box20.getWidth())-Box15.getX()))/2);//ESTA LINEA CENTRA AUTOMATICAMENTE TODO
    Box15.draw();
    Box16.draw();
    Box17.draw();
    Box18.draw();
    Box19.draw();
    Box20.draw();  
    Box15.setY(abs(width-Box15.getHeight())/3);
    Box16.setY(abs(width-Box15.getHeight())/3);
    Box17.setY(abs(width-Box15.getHeight())/3);
    Box18.setY(abs(width-Box15.getHeight())/3);
    Box19.setY(abs(width-Box15.getHeight())/3);
    Box20.setY(abs(width-Box15.getHeight())/3);
    Box16.setX(Box15.getWidth()+Box15.getX());//SE DEBE SEGUIR EL MISMO PATRÓN PARA ORGANIZAR AUTOMATICAMENTE LAS COLUMNAS
    Box17.setX(Box16.getWidth()+Box16.getX());//DEBE HACERSE DESPUÉS DEL <BoXnum>.draw(), NO ANTES.
    Box18.setX(Box17.getWidth()+Box17.getX());
    Box19.setX(Box18.getWidth()+Box18.getX());
    Box20.setX(Box19.getWidth()+Box19.getX());
    icon(bx8, by8, boxSizeH, overAdd, add2, amarillo, beige, "", lgnFont);
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
  text("Ventas", width/2, 100);
  popStyle();
}