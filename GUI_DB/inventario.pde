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
    box1.setX(237);//PRIMERO SE COLOCA LA X INICIAL QUE AFECTA A LAS DEMAS
    runOnce = false;
  }
  box1.draw();
  Box2.draw();
  Box3.draw();
  Box4.draw();
  Box2.setX(box1.getWidth()+box1.getX());//PATRÓN DESPUÉS DEL DRAW.
  Box3.setX(Box2.getWidth()+Box2.getX());
  Box4.setX(Box3.getWidth()+Box3.getX());
  pushStyle();
  textAlign(CENTER);
  textFont(lgnFont);
  text("Inventario", width/2, 100);
  popStyle();
}