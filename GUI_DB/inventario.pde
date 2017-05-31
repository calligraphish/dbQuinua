void inventario() {

  background(morado_oscuro);
  pushStyle();
  imageMode(CORNER); 
  icon(bx6, by6, boxSizeH, overHome, home2, amarillo, beige, "", lgnFont);
  if (runOnce) {
    box1.addItem("ID");
    Box2.addItem("PRODUCTO");
    Box3.addItem("PRECIO");
    Box4.addItem("CANTIDAD");

    msql.query( "SELECT * FROM vw_inventariocl;" );
    while (msql.next())
    {
      String ID = msql.getString("ID");
      String PRODUCTO = msql.getString("PRODUCTO");
      String PRECIO = msql.getString("PRECIO");
      String CANTIDAD = msql.getString("CANTIDAD");
      box1.addItem(ID);
      Box2.addItem(PRODUCTO);
      Box3.addItem(PRECIO);
      Box4.addItem(CANTIDAD);
    }
    runOnce = false;
  }
  if (!(box1.getItems().size()==1)&&permisos()||user.equals("cliente")) {
    if (permisos())icon(bx8, by8, boxSizeH, overAdd, add2, amarillo, beige, "", lgnFont);
    box1.setX((width-((Box4.getX()+Box4.getWidth())-box1.getX()))/2);//ESTA LINEA CENTRA AUTOMATICAMENTE TODO
    box1.draw();
    Box2.draw();
    Box3.draw();
    Box4.draw();
    Box2.setX(box1.getWidth()+box1.getX());//PATRÓN DESPUÉS DEL DRAW.
    Box3.setX(Box2.getWidth()+Box2.getX());
    Box4.setX(Box3.getWidth()+Box3.getX());
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