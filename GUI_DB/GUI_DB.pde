import interfascia.*;
import de.bezier.data.sql.*;
import de.bezier.guido.*;

Listbox listbox, listbox2, listbox3, listbox4, listboxAux;
Object lastItemClicked;

MySQL msql;

int xIni = 50;
int wid = 150;
GUIController c, c1;
IFTextField t, t2, t3;
IFLabel l, l2, l3;
IFButton b1, b2;
IFLookAndFeel defaultLook;
PApplet a = this;
PImage bck, logo, home, home2, inventario, ruta, cliente, venta;
PFont lgnFont;
boolean welcond=true, logcond=false, homcond=false, invcond = false, vencond = false, clicond = false;
String user, pass, database="db_1";
float var = 0.0;
color rojo, amarillo, naranja, aguamarina, morado, azul, beige, lila, morado_oscuro, bLsel, bL, bk, bR, bRsel;
float bx1, by1, bx2, by2, bx3, by3, bx4, by4, bx5, by5, bx6, by6;
int boxSize, boxSizeH;
boolean overHome, overInventario, overRutas, overClientes, overVentas;

boolean runOnce=true;

void setup() {
  size(700, 700);
  lgnFont = createFont("GothamPro-Bold", 40);

  bck = requestImage("bckpht.jpg");
  logo= requestImage("un.png");

  home= loadImage("home.png");
  home2= loadImage("home2.png");
  inventario= loadImage("inventario2.png");
  ruta= loadImage("ruta.png");
  cliente = loadImage("person.png");
  venta = loadImage("book.png");  

  bx1= width/2;
  by1= height-100;
  bx2= width/2-150;
  by2= height/2+150;
  bx3= width/2+150;
  by3= height/2+150;
  bx4= width/2-150;
  by4= height/2-100;
  bx5= width/2+150;
  by5= height/2-100;
  bx6= 90;
  by6= height/8;
  boxSize = 128;
  boxSizeH = 40;

  bLsel = #4C5760;
  bL = #93A8AC;
  bk = #FFFFC7;
  bR = #A59E8C;
  bRsel = #66635B;

  rojo = color(#F52326); //ROJO
  amarillo = color(#E7BC46); //AMARILLO
  naranja = color(#CF7243); //NARANJA
  aguamarina = color(#1C9888); //AGUAMARINA
  morado = color(#511747); // MORADO
  azul = color(#005F72); //AZUL
  beige = color(#F5EDD3); //BEIGE
  lila = color(#271C49); //LILA
  morado_oscuro = color(#487C6E); //MORADO OSCURO

  defaultLook = new IFLookAndFeel(this, IFLookAndFeel.DEFAULT);
  defaultLook.baseColor = naranja;
  defaultLook.borderColor = naranja;
  defaultLook.selectionColor = rojo;
  defaultLook.highlightColor = naranja;
  defaultLook.activeColor = amarillo;
  defaultLook.textColor = beige;
  defaultLook.lightGrayColor = naranja;
  defaultLook.darkGrayColor = beige;

  c = new GUIController(this);
  c.setLookAndFeel(defaultLook);
  c.setVisible(false);


  c1 = new GUIController(this);
  c1.setLookAndFeel(defaultLook);
  c1.setVisible(false);

  t  = new IFTextField("Text Field", width/4, height/3, width/2);
  t2 = new IFTextField("Text Field", width/4, height/3+80, width/2); 

  l3 = new IFLabel("", width/2-20, height/2);

  b1 = new IFButton("", 15, 15, width/4, height/4);
  b2 = new IFButton("", 15, height-height/4-15, width/4, height/4);
  t2.setVisiblePortionStart(0);
  c.add(t);
  c.add(t2);
  c.add(l3);

  t2.addActionListener(this);




  Interactive.make( this );
  Interactive.setActive(false);
  listbox  = new Listbox( xIni, 300, wid, 200);
  listboxAux  = new Listbox( xIni, 300, wid, 200);
  listbox2 = new Listbox( xIni+wid, 300, wid, 200);
  listbox3 = new Listbox( xIni+wid*2, 300, wid, 200);
  listbox4 = new Listbox( xIni+wid*3, 300, wid, 200);
}

void draw() {
  checkOver();
  if (welcond) {
    welcome();
  }
  if (logcond) {
    login();
  }
  if (homcond) {
    homeAdmin();
  }
  if (invcond) {
    inventario();
  }
  if (vencond) {
    ventas();
  }
    if (clicond) {
    clientes();
  }
}

void actionPerformed(GUIEvent e) {
  if (e.getSource()==t2) {
    if (e.getMessage().equals("Completed")) {
      user = t.getValue();
      pass = t2.getValue();
      conectar();
    }
  }
  if (e.getSource()==b1) {
    println("HOME");
  }
  if (e.getSource()==b2) {
    println("CLIENT");
  }
}

void welcome() {
  noStroke();
  background(beige);
  pushMatrix();
  pushStyle();
  fill(amarillo);
  translate(width/2, height/2);
  beginShape();
  for (float theta = 0; theta <= 2*PI; theta +=0.01) {
    float rad = r(theta, 5, 5, 1, 1, abs(sin(var)+2), abs(sin(var)+2));
    float x = rad*cos(theta)*4.0;
    float y = rad*sin(theta)*4.0;
    vertex(x, y);
    rotate(var);
  }
  endShape();

  var += 0.03;
  popMatrix();
  popStyle();

  pushStyle();
  pushMatrix();
  translate(width/2, height/2);
  textAlign(CENTER);
  textFont(lgnFont);
  fill(sin(var)*255);
  text("Bienvenido", 0, 150);
  popStyle();
  popMatrix();
}

void login() {
  pushStyle();
  imageMode(CENTER);
  image(bck, width/2, height/2, 700, 700);
  image(logo, width/2, height-height/6, logo.width/2, logo.height/2);
  popStyle();

  c.setVisible(true);

  pushStyle();
  textAlign(CENTER );
  textFont(lgnFont);
  text("Login", width/2, height/7);
  textAlign(LEFT);
  textSize(30);
  text("user", width/4, height/3-20);
  text("password", width/4, height/3+60);
  popStyle();
}

void conectar() {
  try {
    msql = new MySQL( this, "localhost", database, user, pass );
  }
  catch(Exception exc) {
    println("Something went bad.");
    println(exc.getMessage());
  }
  if (msql.connect()) {
    c.remove(l2);
    c.remove(t);
    c.remove(t2);
    c.remove(l);
    logcond=false;
    homcond=true;
    println("You're in: "+ database);
  } else {
    l3.setSize(200, 200);
    l3.setLabel("Usuario o contraseña incorrecta.");
  }
}

void mousePressed() {
  if (overInventario && homcond) {
    homcond = false;
    invcond = true;
  }  
  if (overVentas && homcond) {
    homcond = false;
    vencond = true;
  }
    if (overClientes && homcond) {
    homcond = false;
    clicond = true;
  }
  if (welcond) {
    welcond=false;
    logcond=true;
  }
  if (overHome && !homcond && invcond) {
    Interactive.deactivate();
    invcond=false;
    homcond=true;
  }
  if (overHome && !homcond && vencond) {
    Interactive.deactivate();
    vencond=false;
    homcond=true;
  }
    if (overHome && !homcond && clicond) {
    Interactive.deactivate();
    clicond=false;
    homcond=true;
  }
}

float r(float theta, float a, float b, float m, float n1, float n2, float n3) {
  return pow(pow(abs(cos(m*theta/4.0)/a), n2) + pow(abs(sin(m*theta/4.0)/b), n3), -1.0/n1);
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

void checkOver() {
  if (mouseX > bx2-boxSize && mouseX < bx2+boxSize && mouseY > by2-boxSize && mouseY < by2+boxSize) {
    overInventario=true;
    println("Is over INVENTARIO");
  } else {
    overInventario=false;
  }
  if (mouseX > bx3-boxSize && mouseX < bx3+boxSize && mouseY > by3-boxSize && mouseY < by3+boxSize) {
    overRutas=true;
    println("Is over RUTAS");
  } else {
    overRutas=false;
  }
  if (mouseX > bx4-boxSize && mouseX < bx4+boxSize && mouseY > by4-boxSize && mouseY < by4+boxSize) {
    overClientes=true;
    println("Is over CLIENTES");
  } else {
    overClientes=false;
  }
  if (mouseX > bx5-boxSize && mouseX < bx5+boxSize && mouseY > by5-boxSize && mouseY < by5+boxSize) {
    overVentas=true;
    println("Is over VENTAS");
  } else {
    overVentas=false;
  }
  if (mouseX > bx6-boxSizeH && mouseX < bx6+boxSizeH && mouseY > by6-boxSizeH && mouseY < by6+boxSizeH) {
    overHome=true;
    println("Is over HOME");
  } else {
    overHome=false;
  }
}

void homeAdmin() {
  background(morado_oscuro);
  c.setVisible(false);
  icon(bx2, by2, boxSize, overInventario, inventario, bLsel, bL, "Inventario", lgnFont);
  icon(bx3, by3, boxSize, overRutas, ruta, bRsel, bR, "Rutas", lgnFont);
  icon(bx4, by4, boxSize, overClientes, cliente, bLsel, bL, "Clientes", lgnFont);
  icon(bx5, by5, boxSize, overVentas, venta, bRsel, bR, "Ventas", lgnFont);
  pushStyle();
  textAlign(CENTER);
  textFont(lgnFont);
  text("Bienvenido, "+user, width/2, 100);
  popStyle();
}

void inventario() {
  background(morado_oscuro);
  pushStyle();
  imageMode(CORNER); 
  icon(bx6, by6, boxSizeH, overHome, home2, amarillo, beige, "", lgnFont);
  if (runOnce) {
    listbox.addItem("ID");
    listbox2.addItem("PRODUCTO");
    listbox3.addItem("PRECIO");
    listbox4.addItem("CANTIDAD");
    listboxAux.addItem("PRECIO");
    msql.query( "SELECT * FROM vw_inventariocl;" );
    while (msql.next())
    {
      String ID = msql.getString("ID");
      String PRODUCTO = msql.getString("PRODUCTO");
      String PRECIO = msql.getString("PRECIO");
      String CANTIDAD = msql.getString("CANTIDAD");
      listbox.addItem(ID);
      listbox2.addItem(PRODUCTO);
      listbox3.addItem(PRECIO);
      listbox4.addItem(CANTIDAD);
      listboxAux.addItem(PRECIO);
    }
    runOnce = false;
  }
  textFont(lgnFont);
  Interactive.setActive(true);
  fill(255);
  textFont(lgnFont);
  text("Inventario", width/3, 100);
  textMode(CENTER);
  popStyle();
}

void ventas() {
  background(morado_oscuro);
  pushStyle();
  imageMode(CORNER); 
  icon(bx6, by6, boxSizeH, overHome, home2, amarillo, beige, "", lgnFont);
  if (runOnce) {
    listbox.addItem("VEN_ID");
    listbox2.addItem("FECHA");
    listbox3.addItem("COSTO_TOTAL");
    listbox4.addItem("NOMBRE_CLIENTE");
    msql.query( "SELECT * FROM vw_ventas_admin;" );
    while (msql.next())
    {
      String VEN_ID = msql.getString("VEN_ID");
      String FECHA = msql.getString("FECHA");
      String COSTO_TOTAL = msql.getString("COSTO_TOTAL");
      String NOMBRE_CLIENTE = msql.getString("NOMBRE_CLIENTE");
      listbox.addItem(VEN_ID);
      listbox2.addItem(FECHA);
      listbox3.addItem(COSTO_TOTAL);
      listbox4.addItem(NOMBRE_CLIENTE);
    }
    runOnce = false;
  }
  textFont(lgnFont);
  Interactive.setActive(true);
  fill(255);
  textFont(lgnFont);
  text("Ventas", width/3, 100);
  textMode(CENTER);
  popStyle();
}

void clientes() {
  background(morado_oscuro);
  pushStyle();
  imageMode(CORNER); 
  icon(bx6, by6, boxSizeH, overHome, home2, amarillo, beige, "", lgnFont);
   if (runOnce) {
      listbox.addItem("NOMBRE_DE_EMPRESA");
      listbox2.addItem("TIPO_DE_EMPRESA");
      listbox3.addItem("REPRESENTANTE_LEGAL");
      listbox4.addItem("TELEFONO");
      msql.query("SELECT * FROM ESTABLECIMIENTO_V;");
      while (msql.next())
      {
            String NOMBRE_DE_EMPRESA = msql.getString("NOMBRE_DE_EMPRESA");
            String TIPO_DE_EMPRESA = msql.getString("TIPO_DE_EMPRESA");
            String REPRESENTANTE_LEGAL = msql.getString("REPRESENTANTE_LEGAL");
            String TELEFONO = msql.getString("TELEFONO");
        listbox.addItem(NOMBRE_DE_EMPRESA);
        listbox2.addItem(TIPO_DE_EMPRESA);
        listbox3.addItem(REPRESENTANTE_LEGAL);
        listbox4.addItem(TELEFONO);
      }
      runOnce = false;
    }
  textFont(lgnFont);
  Interactive.setActive(true);
  fill(255);
  textFont(lgnFont);
  text("Ventas", width/3, 100);
  textMode(CENTER);
  popStyle();
}

//COMO ARREGLAR EL PROBLEMA DE LOS GAPS GRISES:
void keyPressed() {
  if (key=='m') {// se activa oprimiendo m
    listbox.undraw();// undraw() pinta el listbox pero fuera del canvas.
    listboxAux.redraw(xIni, 300);// redraw() lo que hace es pintar el listbox desde la coordinadas (x,y) que se expecifican en los parametros.
  } else {
    listbox.redraw(xIni, 300);
    listboxAux.undraw();
  }
}