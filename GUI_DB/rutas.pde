void rutas() {
  defaultLook.baseColor = beige;
  defaultLook.borderColor = beige;
  defaultLook.selectionColor = aguamarina;
  defaultLook.highlightColor = naranja;
  defaultLook.activeColor = amarillo;
  defaultLook.textColor = color(0);
  defaultLook.lightGrayColor = naranja;
  defaultLook.darkGrayColor = azul;
  background(morado_oscuro);
  pushStyle();
  imageMode(CORNER); 
  icon(bx6, by6, boxSizeH, overHome, home2, amarillo, beige, "", lgnFont);
  if (runOnce) {
    c5.setVisible(true);
    
    Box5 = new Box(h1, 20);
    Box6 = new Box(h1, 20);
    Box7 = new Box(h1, 20);
  
    Box5.addItem("REPARTIDOR");
    Box6.addItem("CLIENTE");
    Box7.addItem("DIRECCION");

    msql.query( "SELECT * FROM vw_rutarepartidor where FECHA="+"'"+q_year+"-"+q_month+"-"+q_day+"'" );
    
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
      pushStyle();
      textAlign(CENTER);
      textFont(lgnFont);
      textSize(18);
    text("Rutas del dia ", width/2,height/2);
    text(q_year+"-"+q_month+"-"+q_day, width/2,height/2+40);
    popStyle();
  } else {
    if (user.equals("root")||user.equals("admon")||user.equals("raul")) {
      pushStyle();
      textAlign(CENTER);
      textFont(lgnFont);
    text("No hay rutas para el dia :", width/2,height/2);
    text(q_year+"-"+q_month+"-"+q_day, width/2,height/2+40);
      popStyle();
    } else {
      pushStyle();
      textAlign(CENTER);
      textFont(lgnFont);
      text("No tienes los permisos correctos.", width/2, height/2);
      popStyle();
    }
  }
  pushStyle();
  textAlign(CENTER);
  textFont(lgnFont);
  text("Rutas", width/2, 100);
  popStyle();
  text("Año", 400, 198);
  text("AAAA", 400, 233);
  text("Mes", 470, 198);
  text("MM", 470, 233);
  text("Dia", 520, 198);
  text("DD", 520, 233);
}