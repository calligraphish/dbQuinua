void logOut() {
  if (runOnce) {
    msql.close();
    user="";
    pass="";
    t.setValue("");
    t2.setValue("");
    l3.setLabel("");
    println("logged out");
    runOnce=false;
  }
}