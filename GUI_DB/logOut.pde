void logOut() {
  if (runOnce3) {
    msql.close();
    user="";
    pass="";
    t.setValue("");
    t2.setValue("");
    l3.setLabel("");
    println("logged out");
    runOnce3=false;
  }
}