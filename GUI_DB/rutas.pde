void rutas() {
  background(morado_oscuro);
  pushStyle();
  imageMode(CORNER); 
  icon(bx6, by6, boxSizeH, overHome, home2, amarillo, beige, "", lgnFont);
  if (runOnce4) {
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
    Box5.setX(180);//SE COLOCA LA X INICIAL DE TODA LA TABLA: ESTA DICTAMINA LA POSICION DE LAS OTRAS COLUMNAS
    runOnce4 = false;
  }
  Box5.draw();
  Box6.draw();
  Box7.draw();
    
  Box6.setX(Box5.getWidth()+Box5.getX());//SE DEBE SEGUIR EL MISMO PATRÓN PARA ORGANIZAR AUTOMATICAMENTE LAS COLUMNAS
  Box7.setX(Box6.getWidth()+Box6.getX());//DEBE HACERSE DESPUÉS DEL <BoXnum>.draw(), NO ANTES.
  
  pushStyle();
  textAlign(CENTER);
  textFont(lgnFont);
  text("Rutas", width/2, 100);
  text("Las rutas para "+day()+"-"+month()+"-"+year()+" son:",width/2, 250);
  popStyle();
}