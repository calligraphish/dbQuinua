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

void actionPerformed(GUIEvent e) {
  if (e.getSource()==t2) {
    if (e.getMessage().equals("Completed")) {
      user = t.getValue();
      pass = t2.getValue();
      conectar();
    }
  }
}

void conectar() {
  msql = new MySQL( this, "localhost", database, user, pass );
  if (msql.connect()) {
    c.remove(t);
    c.remove(t2);
    logcond=false;
    homcond=true;
    println("You're in: "+ database);
  } else {
    l3.setLabel("Usuario o contraseña incorrecta.");
  }
}