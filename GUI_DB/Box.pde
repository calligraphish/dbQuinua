import java.util.ArrayList;

public class Box {
  ArrayList items;
  int x, y, h, w, cell;
  int largestString, txSize;
  public Box(int yCoordinate, int heigthCell) {
    this.x = width/3; 
    this.y = yCoordinate;
    this.cell= heigthCell;
    this.txSize =10;
  }

  void draw() {
    if ( items != null ) {
      this.w = this.largestString*9;
      this.h = this.items.size()-1*this.cell;
      for ( int i = 0; i < this.items.size(); i++ ) {
        pushStyle();
        noStroke();
        if (i%2==0) {
          fill( 255 );
        } else {
          fill(#ACCDDE);
        }
        rect(this.x, this.y + (i*this.cell), this.w, this.cell);

        noStroke();
        fill(0);
        //textAlign(LEFT);
        textFont(lgnFont);
        textSize(txSize);//EL TAMAÑO DE LA FUENTE DEFAULT ES 10px.
        text(items.get(i).toString(), this.x+2, this.y+(i+1)*this.cell-5);
        popStyle();
      }
    }
  }

  public void remove() {
    items.clear();
  }
  
  public void addItem(String st ) {
    if ( items == null ) { 
      this.items = new ArrayList();
    }
    this.items.add(st);
    largestString = items.get(0).toString().length();
    for (int i = 0; i < items.size(); i++) {
      if (items.get(i).toString().length() > largestString) {
        largestString = items.get(i).toString().length();
      }
    }
  }
  public int getWidth(){
    return this.w;
  }
  public void setX(int xi){
    this.x = xi;
  }
  public int getX(){
    return this.x;
  }
  public ArrayList getItems(){
    return this.items;
  }
  public void setTextSize(int size){
    this.txSize = size;
  }
}