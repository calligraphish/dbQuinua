void login() {
  noTint();
  pushStyle();
  imageMode(CENTER);
  image(bck, width/2, height/2, 700, 700);
  image(logo, width/2-80, height-height/6, logo.width/2, logo.height/2);
  image(LogoQuinua, width/2+80, height-height/6, LogoQuinua.width/12, LogoQuinua.height/12);
  popStyle();
  pushStyle();
  textAlign(CENTER );
  textFont(lgnFont);
  text("Login", width/2, height/7);
  textAlign(LEFT);
  textSize(30);
  text("user", width/4, height/3-20);
  text("password", width/4, height/3+60);
  popStyle();
  c.setVisible(true);
}
String pazz="";
void actionPerformed(GUIEvent e) {
  if (e.getSource()==t2) {
    if (e.getMessage().equals("Completed")) {
      user = t.getValue();
      pass = t2.getValue();
      conectar();
      t.setValue("");
      t2.setValue("");
    }
  }
  if(e.getSource()==t21){ //evento para que detecte cuando se haga enter en la casilla de dia
    if (e.getMessage().equals("Completed")) {
      q_year = t19.getValue();
      q_month = t20.getValue();
      q_day = t21.getValue();
      Box5.remove();
      Box6.remove();
      Box7.remove();
      runOnce = true;
      //println(q_year,q_month,q_day); //debug
      t19.setValue("");
      t20.setValue("");
      t21.setValue("");
  }
  }
}

void conectar() {
  msql = new MySQL( this, "localhost", database, user, pass );
  if (msql.connect()) {
    c.setVisible(false);
    logcond=false;
    out=false;
    runOnce=true;
    homcond=true;
    println("You're in: "+ database);
  } else {
    l3.setLabel("Usuario o contraseña incorrecta.");
  }
}