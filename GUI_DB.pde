import interfascia.*;
import de.bezier.data.sql.*;

MySQL msql;

boolean welcond=true, logcond=false;
String user, pass, database="db_1";

float var = 0.0;

GUIController c;
IFTextField t, t2, t3;
IFLabel l, l2, l3;


void setup() {
  size(700, 700);
  textAlign(CENTER);
  textFont(createFont("Georgia", 32));
  noStroke();
  //fill(#D34949); 


  
  c = new GUIController(this);
  c.setVisible(false);
  t  = new IFTextField("Text Field", width/4, height/3, width/2);
  t2 = new IFTextField("Text Field", width/4, height/3+80, width/2, "contraseña");

  l  = new IFLabel("User", width/4, height/3-20);
  l2 = new IFLabel("Password", width/4, height/3+50);

  l3 = new IFLabel("", width/2-20, height/2);

  c.add(l2);
  c.add(t);
  c.add(t2);
  c.add(l);
  c.add(l3);

  t2.addActionListener(this);
}

void draw() {
  background(#454E76);
  if (welcond) {
    welcome();
  }
  if (logcond) {
    c.setVisible(true);
  }
}

void actionPerformed(GUIEvent e) {
  if (e.getSource()==t2 && e.getMessage().equals("Completed") ) {
    user = t.getValue();
    pass = t2.getValue();
    c.remove(t);
    c.remove(t2);
    c.remove(l);
    c.remove(l2);
    l3.setLabel("Hi!");
    msql = new MySQL( this, "localhost", database, user, pass );
  }
}

void welcome() {
  translate(width/2, height/2);
  pushMatrix();
  pushStyle();
  beginShape();
  for (float theta = 0; theta <= 2*PI; theta +=0.01) {
    float rad = r(theta, 
      25.0, 
      25.0, 
      5.0, 
      1.0, 
      sin(var), 
      sin(var));
    float x = rad*cos(theta)*4.0;
    float y = rad*sin(theta)*4.0;
    vertex(x, y);
    rotate(var);
  }  
  endShape();
  popMatrix();

  var += 0.03;
  //textSize(90);
  text("Bienvenido", 0, 150);
}

void mousePressed() {
  welcond=false;
  logcond=true;
}

void keyPressed() {
  if (key=='M') {
    if ( msql.connect() )
    {  
      try {
        msql.query( "START TRANSACTION;" );
        msql.query( "CALL sp_compracl(1,1,FUN_ultima_venta()+1,1);" );
        msql.query( "INSERT INTO detalle_venta values(FUN_ultima_venta(),2,17);" );
        msql.query( "ROLLBACK;" );
      }
      catch(Exception e) {
        msql.query( "ROLLBACK;" );
        println("Something went bad :V");
      }
    }
  }
}

void query(){
  if ( msql.connect() )
  {  
    try {
      msql.query( "START TRANSACTION;" );
      msql.query( "CALL sp_compracl(1,1,FUN_ultima_venta()+1,1);" );
      msql.query( "SELECT * FROM venta" );
      while (msql.next())
       {
       String s = msql.getString("ven_fecha");
       int n = msql.getInt("ven_id");
       println(n + "   " + s);
       }
      msql.query( "INSERT INTO detalle_venta values(FUN_ultima_venta(),2,17);" );
      msql.query( "ROLLBACK;" );
    }
    catch(Exception e) {
      msql.query( "ROLLBACK;" );
      println("Something went bad :V");
    }
    //msql.next();
    //println( "number of rows: " + msql.getInt(1) );
  } else
  {
    // connection failed !
  }
}

float r(float theta, float a, float b, float m, float n1, float n2, float n3){
  return pow(pow(abs(cos(m*theta/4.0)/a),n2) + pow(abs(sin(m*theta/4.0)/b),n3),-1.0/n1);
}