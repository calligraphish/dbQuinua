import interfascia.*;
import de.bezier.data.sql.*;
MySQL msql;
GUIController c;
IFTextField t, t2;
IFLabel l3;
IFLookAndFeel defaultLook;

Box box1, Box2, Box3, Box4, Box5, Box6, Box7, Box8, Box9, Box10, Box11, Box15, Box16, Box17, Box18, Box19, Box20, Box21, Box22, Box23, Box24;

boolean runOnce=true, runOnce2=true, runOnce3=true, runOnce4=true, runOnce5=true,runOnce6 = true;
boolean overHome, overInventario, overRutas, overClientes, overVentas, overLogOut, overAdd;
boolean welcond=true, logcond=false, homcond=false, invcond = false, vencond = false, rutcond = false, clicond=false, out = false, intcond=false;
color rojo, amarillo, naranja, aguamarina, morado, azul, beige, lila, morado_oscuro, bLsel, bL, bk, bR, bRsel;
float var = 0.0;
float bx1, by1, bx2, by2, bx3, by3, bx4, by4, bx5, by5, bx6, by6, bx7, by7, bx8, by8;
int boxSize, boxSizeH, boxSizeLO, h1, h2, h3;
PImage bck, logo, home, home2, inventario, ruta, cliente, venta, logOut, back, add;
PFont lgnFont;
String user, pass, database="db_1";

void setup() {
  size(700, 700);
  lgnFont = createFont("GothamPro-Bold", 40);

  bck = requestImage("bckpht.jpg");
  add= requestImage("add.png");
  logo= requestImage("un.png");
  back= requestImage("back.png");
  home= loadImage("home.png");
  home2= loadImage("home2.png");
  inventario= loadImage("inventario2.png");
  ruta= loadImage("ruta.png");
  cliente = loadImage("person.png");
  venta = loadImage("book.png");  
  logOut = loadImage("power.png");
  add = loadImage("add.png");
  back = loadImage("back.png");

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
  bx7= width-90;
  by7= height/8;
  bx8= 90;
  by8= height*7/8;
  boxSize = 128;
  boxSizeH = 40;
  boxSizeLO = 40;

  h1 = 300;
  h2 = 300;
  h3 = 300;

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

  t  = new IFTextField("Text Field", width/4, height/3, width/2);
  t2 = new IFTextField("Text Field", width/4, height/3+80, width/2); 
  l3 = new IFLabel("", width/2-20, height/2);

  c.add(t);
  c.add(t2);
  c.add(l3);

  t2.addActionListener(this);


  //CREACIÓN DE COLUMNAS ENLAZADAS PARA HACER TABLAS
  box1 = new Box(h1, 20);//SOLO RECIBEN 2 PARÁMETROS: LA ALTURA Y EL ALTO DE LA CELDA.
  Box2 = new Box(h1, 20);
  Box3 = new Box(h1, 20);
  Box4 = new Box(h1, 20);

  Box5 = new Box(h1, 20);
  Box6 = new Box(h1, 20);
  Box7 = new Box(h1, 20);

  Box8 = new Box(h1, 20);
  Box9 = new Box(h1, 20);
  Box10 = new Box(h1, 20);
  Box11 = new Box(h1, 20);

  Box15 = new Box(h2, 20);
  Box16 = new Box(h2, 20);
  Box17 = new Box(h2, 20);
  Box18 = new Box(h2, 20);
  Box19 = new Box(h2, 20);
  Box20 = new Box(h2, 20);

  Box21 = new Box(h1, 20);
  Box22 = new Box(h1, 20);
  Box23 = new Box(h1, 20);
  Box24 = new Box(h1, 20);
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
  if (rutcond) {
    rutas();
  }
  if (clicond) {
    clientes();
  }
  if (intcond) {
    ingresar();
  }
  if (out) {
    logOut();
    login();
  }  
  text(mouseX, 20, 10);//IMPRIME LAS COORDENADAS DE X EN UNA ESQUINA PARA QUE CENTRAR SEA MÁS FÁCIL
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
  if (overRutas && homcond) {
    homcond = false;
    rutcond = true;
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
    invcond=false;
    box1.remove();
    Box2.remove();
    Box3.remove();
    Box4.remove();
    runOnce = true;
    homcond=true;
  }
  if (overHome && !homcond && vencond) {
    vencond=false;
    Box15.remove();
    Box16.remove();
    Box17.remove();
    Box18.remove();
    Box19.remove();
    Box20.remove(); 
    runOnce2 = true;
    homcond=true;
  }
  if (overAdd && clicond) {
    clicond = false;
    Box21.remove();
    Box22.remove();
    Box23.remove();
    Box24.remove();
    runOnce = true;
    intcond = true;
  }
  if (overHome && !homcond && rutcond) {
    rutcond=false;
    Box5.remove();
    Box6.remove();
    Box7.remove(); 
    runOnce4 = true;
    homcond=true;
  }
  if (overHome && !homcond && clicond) {
    clicond=false;
    Box21.remove();
    Box22.remove();
    Box23.remove();
    Box24.remove();
    runOnce5 = true;
    homcond=true;
  }
  if (overHome && !homcond && intcond) {
    intcond=false;
    Box21.remove();
    Box22.remove();
    Box23.remove();
    Box24.remove();
    runOnce5 = true;
    homcond=true;
  }
  if (overLogOut && intcond) {
    intcond = false;
    runOnce = true;
    clicond = true;
  }
  if (overLogOut && homcond) {
    homcond = false;
    runOnce3=true;
    out = true;
  }
}