import interfascia.*;

PImage ic1, ic2, ic3, bck;
PFont f;
GUIController c;
IFButton b1, b2;
IFLabel l;
IFLookAndFeel defaultLook;
color rojo, amarillo, naranja, aguamarina, morado, azul, beige, lila, morado_oscuro, bLsel, bL, bk, bR, bRsel;


float bx1, by1, bx2, by2, bx3, by3;
boolean overBox1 = false, overBox2 = false, overBox3 = false;
int boxSize;
void setup() {
  size(700, 700);
  bx1= width/2;
  by1= height-100;
  bx2= width/2-150;
  by2= height/2;
  bx3= width/2+150;
  by3= height/2;
  boxSize = 128;

  bLsel = #4C5760;
  bL = #93A8AC;
  bk = #FFFFC7;
  bR = #A59E8C;
  bRsel = #66635B;

  rojo = #F52326; //ROJO
  amarillo = #E7BC46; //AMARILLO
  naranja = #CF7243; //NARANJA
  aguamarina = #1C9888; //AGUAMARINA
  morado = #511747; // MORADO
  azul = #005F72; //AZUL
  beige = #F5EDD3; //BEIGE
  lila = #271C49; //LILA
  morado_oscuro = #110D29; //MORADO OSCURO

  defaultLook = new IFLookAndFeel(this, IFLookAndFeel.DEFAULT);
  defaultLook.baseColor = beige;
  defaultLook.borderColor = beige;
  defaultLook.selectionColor = morado_oscuro;
  defaultLook.highlightColor = beige;
  defaultLook.activeColor = amarillo;
  defaultLook.textColor = aguamarina;
  defaultLook.lightGrayColor = naranja;
  defaultLook.darkGrayColor = rojo;


  try {
    ic1= loadImage("home.png");
    ic2= loadImage("book.png");
    ic3= loadImage("ruta.png");
    bck= loadImage("bckpht.jpg");
  }
  catch(Exception ex) {
    println(ex.getMessage());
  }
  
  f = createFont("GothamPro-Bold",30);
  
  c = new GUIController (this);
  c.setLookAndFeel(defaultLook);

  /*b1 = new IFButton ("Green", 30, 35, 100, 30);
   b2 = new IFButton ("Blue", 110, 35, 100, 30);
   
   b1.addActionListener(this);
   b2.addActionListener(this);
   
   c.add (b1);
   c.add (b2);*/
  imageMode(CENTER);
  rectMode(RADIUS);
}

void draw() {
  background(morado_oscuro);
  icon(bx1, by1, boxSize/2, overBox1, ic1, bk, beige, "",f);
  icon(bx2, by2, boxSize, overBox2, ic2, bLsel, bL, "Inventario",f);
  icon(bx3, by3, boxSize, overBox3, ic3, bRsel, bR, "Rutas",f);
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