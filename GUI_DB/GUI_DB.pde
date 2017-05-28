import interfascia.*;
import de.bezier.data.sql.*;
import java.sql.SQLException;
import de.bezier.guido.*;

Listbox listbox;
Object lastItemClicked;

MySQL msql;

GUIController c, c1;
IFTextField t, t2, t3;
IFLabel l, l2, l3;
IFButton b1, b2;
IFLookAndFeel defaultLook;

PImage bck, logo, home, inventario, ruta;
PFont lgnFont;
boolean welcond=true, logcond=false, logged=false;
String user, pass, database="db_1";
float var = 0.0;
color rojo, amarillo, naranja, aguamarina, morado, azul, beige, lila, morado_oscuro;

void setup() {
  size(700, 700);
/*me gustan las papas con salsa de tomate,
la carne en bisteck, y los fideos instantaneos*/
  lgnFont = createFont("GothamPro-Bold", 40);

  bck = requestImage("bckpht.jpg");
  logo= requestImage("un.png");

  home= loadImage("home.png");
  inventario= loadImage("book.png");
  ruta= loadImage("ruta.png");

  rojo = color(#F52326); //ROJO
  amarillo = color(#E7BC46); //AMARILLO
  naranja = color(#CF7243); //NARANJA
  aguamarina = color(#1C9888); //AGUAMARINA
  morado = color(#511747); // MORADO
  azul = color(#005F72); //AZUL
  beige = color(#F5EDD3); //BEIGE
  lila = color(#271C49); //LILA
  morado_oscuro = color(#110D29); //MORADO OSCURO

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

  /*c1.add(b1);
   c1.add(b2);
   
   b1.addActionListener(this);
   b2.addActionListener(this);*/
  t2.addActionListener(this);
  
  Interactive.make( this );
  listbox = new Listbox( 20, 60, width-40, height-80 );

  textAlign(CENTER);
  noStroke();
  imageMode(CENTER);
  rectMode(RADIUS);
}

void draw() {
  if (welcond) {
    welcome();
  }
  if (logcond) {
    login();
  }
  if (logged) {
    //image(bck, 0, 0, 700, 700);
    background(beige);
    c.setVisible(false);
    c1.setVisible(true);

    pushStyle();
    textFont(lgnFont);
    text("Bienvenido,"+user, width/2, height/2);
    popStyle();
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
  translate(width/2, height/2);
  background(beige);
  pushMatrix();
  pushStyle();
  fill(amarillo);

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
  textFont(lgnFont);
  fill(sin(var)*255);
  text("Bienvenido", 0, 150);
  popStyle();
}

void login() {
  image(bck, width/2, height/2, 700, 700);

  pushStyle();
  imageMode(CENTER);
  image(logo, width/2, height-height/6, logo.width/2, logo.height/2);
  popStyle();

  c.setVisible(true);

  pushStyle();
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
    logged=true;
    println("You're in: "+ database);
  } else {
    l3.setSize(200,200);
    l3.setLabel("Usuario o contraseña incorrecta.");
  }
}

void mousePressed() {
  if (welcond) {
    welcond=false;
    logcond=true;
  }
}

float r(float theta, float a, float b, float m, float n1, float n2, float n3) {
  return pow(pow(abs(cos(m*theta/4.0)/a), n2) + pow(abs(sin(m*theta/4.0)/b), n3), -1.0/n1);
}

void icon(float x, float y, float size, boolean over, PImage im, color on, color off, String tx, PFont font) {

  if (mouseX > x-size && mouseX < x+size && mouseY > y-size && mouseY < y+size) {
    over=true;
    println("Is over "+ im.toString());
  } else {
    over=false;
  }

  if (over) {
    tint(on);
    fill(255);
  } else {
    tint(off);
    fill(255);
  }

  pushStyle();
  textFont(font);
  textAlign(CENTER);
  image(im, x, y, size, size);
  text(tx, x, y+size-20);
  popStyle();
}