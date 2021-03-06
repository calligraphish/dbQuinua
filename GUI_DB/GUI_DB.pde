//VERSIONGITHUB

import interfascia.*;
import de.bezier.data.sql.*;
MySQL msql;
GUIController c, c2, c3, c4, c5;
IFTextField t, t2, t3, t4, t5, t6, t7, t8, t9, t10, t11, t12, t13, t14, t15, t16, t17, t18, t19, t20, t21, t22, t23;
IFLabel l3;
IFLookAndFeel defaultLook;

Box box1, Box2, Box3, Box4, Box5, Box6, Box7, Box8, Box9, Box10, Box11, Box15, Box16, Box17, Box18, Box19, Box20, Box21, Box22, Box23, Box24;

boolean bcare, exitd =false;
int foo = 0;
boolean runOnce=true;
boolean overHome, overInventario, overRutas, overClientes, overVentas, overLogOut, overAdd, overCommit, overYes, overNo;
boolean welcond=true, logcond=false, homcond=false, invcond = false, vencond = false, rutcond = false, clicond=false, out = false, outAux = false, intcond=false, buycond= false, actcond= false;
color rojo, amarillo, naranja, aguamarina, morado, azul, beige, lila, morado_oscuro, bLsel, bL, bk, bR, bRsel;
float var = 0.0;
float bx1, by1, bx2, by2, bx3, by3, bx4, by4, bx5, by5, bx6, by6, bx7, by7, bx8, by8, bx9, by9;
int boxSize, boxSizeH, boxSizeLO, boxSizeC, h1, h2, h3;
PImage bck, logo, home, home2, inventario, ruta, cliente, venta, logOut, back, add, add2, commit, LogoQuinua;
PFont lgnFont;
String user, pass, database="db_1", q_year=String.valueOf(year()), q_month=String.valueOf(month()), q_day=String.valueOf(day());

void setup() {
  size(700, 700);
  lgnFont = createFont("GothamPro-Bold", 40);

  bck = requestImage("bckpht.jpg");
  add= requestImage("add.png");
  add2= requestImage("add2.png");
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
  commit = loadImage("ventas.png");
  LogoQuinua = loadImage("Q Dorado.png");

  boxSize = 128;
  boxSizeH = 40;
  boxSizeLO = 40;
  boxSizeC = 64;

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
  bx8= width-90;
  by8= height/8+boxSizeH+15;
  bx9 =width/2;
  by9 =height/2-150;

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

  c2 = new GUIController(this);
  c2.setLookAndFeel(defaultLook);
  c2.setVisible(false);

  c3 = new GUIController(this);
  c3.setLookAndFeel(defaultLook);
  c3.setVisible(false);

  c4 = new GUIController(this);
  c4.setLookAndFeel(defaultLook);
  c4.setVisible(false);

  c5 = new GUIController(this);
  c5.setLookAndFeel(defaultLook);
  c5.setVisible(false);

  t  = new IFTextField("Text Field", width/4, height/3, width/2);
  t2 = new IFPasswordField("Text Field", width/4, height/3+80, width/2, "", '*');
  l3 = new IFLabel("", width/2-20, height/2);

  t3 = new IFTextField("Text Field", width/4, height/2-50, width/2); 
  t4 = new IFTextField("Text Field", width/4, height/2, width/2);
  t5 = new IFTextField("Text Field", width/4, height/2+50, width/2); 
  t6 = new IFTextField("Text Field", width/4, height/2+100, width/2);
  t22 = new IFTextField("Text Field", width/4, height/2+150, width/2); 
  t23 = new IFTextField("Text Field", width/4, height/2+200, width/2); 

  t7 = new IFTextField("Text Field", width/4, height/2-50, width/2); 
  t8 = new IFTextField("Text Field", width/4, height/2, width/2);
  t9 = new IFTextField("Text Field", width/4, height/2+50, width/2); 
  t10 = new IFTextField("Text Field", width/4, height/2+100, width/2); 
  t11 = new IFTextField("Text Field", width/4, height/2+150, width/2); 
  t12 = new IFTextField("Text Field", width/4, height/2+200, width/2); 
  t13 = new IFTextField("Text Field", width/4, height/2+250, width/2); 

  t14 = new IFTextField("Text Field", width/4, height/2, width/2); 
  t15 = new IFTextField("Text Field", width/4, height/2+50, width/2); 
  t16 = new IFTextField("Text Field", width/4, height/2+100, width/2); 
  t17 = new IFTextField("Text Field", width/4, height/2+150, width/2); 
  t18 = new IFTextField("Text Field", width/4, height/2+200, width/2);

  t19 = new IFTextField("Text Field", 400, 200, 60);
  t20 = new IFTextField("Text Field", 470, 200, 40);
  t21 = new IFTextField("Text Field", 520, 200, 40);

  c.add(t);
  c.add(t2);
  c.add(l3);

  c2.add(t3);
  c2.add(t4);
  c2.add(t5);
  c2.add(t6);
  c2.add(t22);
  c2.add(t23);

  c3.add(t7);
  c3.add(t8);
  c3.add(t9);
  c3.add(t10);
  c3.add(t11);
  c3.add(t12);
  c3.add(t13);

  c4.add(t14);
  c4.add(t15);
  c4.add(t16);
  c4.add(t17);
  c4.add(t18);

  c5.add(t19);
  c5.add(t20);
  c5.add(t21);

  t2.addActionListener(this);

  t21.addActionListener(this);

  //CREACIÓN DE COLUMNAS ENLAZADAS PARA HACER TABLAS
  box1 = new Box(h1, 20);//SOLO RECIBEN 2 PARÁMETROS: LA ALTURA Y EL ALTO DE LA CELDA.
  Box2 = new Box(h1, 20);
  Box3 = new Box(h1, 20);
  Box4 = new Box(h1, 20);

  box1.setTextSize(20);
  Box2.setTextSize(20);
  Box3.setTextSize(20);
  Box4.setTextSize(20);

  /*Box5 = new Box(h1, 20);
   Box6 = new Box(h1, 20);
   Box7 = new Box(h1, 20);*/

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

  if (!exitd) {
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
    if (buycond) {
      compra();
    }
    if (actcond) {
      actualizar();
    }
    if (outAux) {
      sure();
    }  
    if (out) {
      logOut();
      login();
    }  
    text(mouseX, 20, 10);//IMPRIME LAS COORDENADAS DE X EN UNA ESQUINA PARA QUE CENTRAR SEA MÁS FÁCIL
    text(mouseY, 60, 10);
    holi();
  } else {
    thanks();
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
    runOnce = true;
    homcond=true;
  }
  if (overAdd && vencond && permisos()) {
    vencond=false;
    Box15.remove();
    Box16.remove();
    Box17.remove();
    Box18.remove();
    Box19.remove();
    Box20.remove(); 
    runOnce = true;
    buycond=true;
  }
  if (overAdd && clicond && permisos()) {
    clicond = false;
    Box21.remove();
    Box22.remove();
    Box23.remove();
    Box24.remove();
    runOnce = true;
    intcond = true;
  }
  if (overAdd && invcond && permisos()) {
    invcond = false;
    box1.remove();
    Box2.remove();
    Box3.remove();
    Box4.remove();
    runOnce = true;
    actcond = true;
  }
  if (overHome && !homcond && rutcond) {
    rutcond=false;
    Box5.remove();
    Box6.remove();
    Box7.remove(); 
    runOnce = true;
    homcond=true;
  }
  if (overHome && !homcond && clicond) {
    clicond=false;
    Box21.remove();
    Box22.remove();
    Box23.remove();
    Box24.remove();
    runOnce = true;
    homcond=true;
  }
  if (overHome && !homcond && intcond) {
    intcond=false;
    Box21.remove();
    Box22.remove();
    Box23.remove();
    Box24.remove();
    c2.setVisible(false);
    runOnce = true;
    homcond=true;
  }
  if (overLogOut && intcond) {
    intcond = false;
    runOnce = true;
    t3.setValue("");
    t4.setValue("");
    t5.setValue("");
    t6.setValue("");
    clicond = true;
  }
  if (overLogOut && buycond) {
    buycond = false;
    runOnce = true;
    t7.setValue("");
    t8.setValue("");
    t9.setValue("");
    t10.setValue("");
    t11.setValue("");
    t12.setValue("");
    t13.setValue("");
    c3.setVisible(false);
    vencond = true;
  }
  if (overLogOut && actcond) {
    actcond = false;
    runOnce = true;
    t14.setValue("");
    t15.setValue("");
    t16.setValue("");
    t17.setValue("");
    t18.setValue("");
    c4.setVisible(false);
    invcond = true;
  }
  if (overHome && !homcond && buycond) {
    buycond=false;
    Box15.remove();
    Box16.remove();
    Box17.remove();
    Box18.remove();
    Box19.remove();
    Box20.remove(); 
    runOnce = true;
    c3.setVisible(false);
    homcond=true;
  }
  if (overHome && !homcond && actcond) {
    actcond=false;
    box1.remove();
    Box2.remove();
    Box3.remove();
    Box4.remove();
    runOnce = true;
    c4.setVisible(false);
    homcond=true;
  }
  if (overCommit && intcond) {
    msql.query("CALL sp_registrocl(\""+t3.getValue()+"\",\""+t4.getValue()+"\",\""+t5.getValue()+"\",\""+t6.getValue()+"\",\""+t22.getValue()+"\",\""+t23.getValue()+"\");");
    intcond = false;
    runOnce = true;
    t3.setValue("");
    t4.setValue("");
    t5.setValue("");
    t6.setValue("");
    t22.setValue("");
    t23.setValue("");
    c2.setVisible(false);
    clicond = true;
  }
  if (overCommit && buycond) {
    msql.query("CALL sp_ventacompleta (\""+t7.getValue()+"\",\""+t8.getValue()+"\",\""+t9.getValue()+"\",\""+t10.getValue()+"\",\""+t11.getValue()+"\",\""+t12.getValue()+"\",\""+t13.getValue()+"\");");
    buycond = false;
    runOnce = true;
    t7.setValue("");
    t8.setValue("");
    t9.setValue("");
    t10.setValue("");
    t11.setValue("");
    t12.setValue("");
    t13.setValue("");
    c3.setVisible(false);
    vencond = true;
  }
  if (overCommit && actcond) {
    msql.query("CALL sp_compracompleta (\""+t14.getValue()+"\",\""+t15.getValue()+"\",\""+t16.getValue()+"\",\""+t17.getValue()+"\",\""+t18.getValue()+"\");");
    actcond = false;
    runOnce = true;
    t14.setValue("");
    t15.setValue("");
    t16.setValue("");
    t17.setValue("");
    t18.setValue("");
    c4.setVisible(false);
    invcond = true;
  }
  if (overYes && outAux) {
    homcond = false;
    runOnce=true;
    outAux =false;
    out = true;
  }
  if (overNo && outAux) {
    outAux = false;
    runOnce=true;
    homcond = true;
  }
  if (overLogOut && homcond) {
    homcond = false;
    runOnce=true;
    outAux = true;
  }
}

boolean permisos() {
  if (user.equals("root")||user.equals("admon")) return true;
  else return false;
}

void holi() {
  pushStyle();
  fill(#0A3E43);
  rect(0, height-10, width, 10);
  fill(255);
  textAlign(CENTER);
  text("Hecho por: BuenosEstudiantesUN™", width/2, height);
  popStyle();
}

void keyPressed() {
  if (keyCode==SHIFT) {
    exitd =true;
  }
}


void thanks() {
  background(random(255), random(255), random(255));
  fill(255);
  textAlign(CENTER);
  textFont(lgnFont);
  textSize(90);
  text("¡Gracias!", width/2, height/2);
  delay(1000);
}