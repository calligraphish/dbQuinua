void homeAdmin() {
  background(morado_oscuro);
  c.setVisible(false);
  icon(bx2, by2, boxSize, overInventario, inventario, bLsel, bL, "Inventario", lgnFont);
  icon(bx3, by3, boxSize, overRutas, ruta, bRsel, bR, "Rutas", lgnFont);
  icon(bx4, by4, boxSize, overClientes, cliente, bLsel, bL, "Clientes", lgnFont);
  icon(bx5, by5, boxSize, overVentas, venta, bRsel, bR, "Ventas", lgnFont);
  icon(bx7, by7, boxSizeLO, overLogOut, logOut, rojo, beige, "", lgnFont);
  pushStyle();
  textAlign(CENTER);
  textFont(lgnFont);
  text("Bienvenido, "+user, width/2, 100);
  popStyle();
}

void icon(float x, float y, float size, boolean o, PImage im, color on, color off, String tx, PFont font) {
  if (o) {
    tint(on);
    fill(255);
  } else {
    tint(off);
    fill(255);
  }

  pushStyle();
  textFont(font);
  textAlign(CENTER);
  imageMode(CENTER);
  image(im, x, y, size, size);
  text(tx, x, y+size-20);
  popStyle();
}