public class Listbox
{
    float x, y, width, height;
    
    ArrayList items;
    int itemHeight = 20;
    int listStartAt = 0;
    int hoverItem = -1;
    
    float valueY = 0;
    boolean hasSlider = false;
    Listbox ( float xx, float yy, float ww, float hh ) 
    {
        x = xx; y = yy;
        valueY = y;
        
        width = ww; height = hh;
        
        // register it
        Interactive.add( this );
    }
    
    public void addItem ( String item )
    {
        if ( items == null ) items = new ArrayList();
        items.add( item );
        
        hasSlider = items.size() * itemHeight > height;
    }
    
    public void mouseMoved ( float mx, float my )
    {
        if ( hasSlider && mx > width-20 ) return;
        
        hoverItem = listStartAt + int((my-y) / itemHeight);
    }
    
    public void mouseExited ( float mx, float my )
    {
        hoverItem = -1;
    }
    
    // called from manager
    void mouseDragged ( float mx, float my )
    {
        if ( !hasSlider ) return;
        if ( mx < x+width-20 ) return;
        
        valueY = my-10;
        valueY = constrain( valueY, y, y+height-20 );
        
        update();
    }
    
    // called from manager
    void mouseScrolled ( float step )
    {
        valueY += step;
        valueY = constrain( valueY, y, y+height-20 );
        
        update();
    }
    
    void update ()
    {
        float totalHeight = items.size() * itemHeight;
        float itemsInView = height / itemHeight;
        float listOffset = map( valueY, y, y+height-20, 0, totalHeight-height );
        
        listStartAt = int( listOffset / itemHeight );
    }
    
    public void mousePressed ( float mx, float my )
    {
        if ( hasSlider && mx > width-20 ) return;
        
        int item = listStartAt + int( (my-y) / itemHeight);
        itemClicked( item, items.get(item) );
    }

    void draw ()
    {
        noStroke();
        fill( 100 );
        rect( x,y,this.width,this.height );
        if ( items != null )
        {
            for ( int i = 0; i < int(height/itemHeight) && i < items.size(); i++ )
            {
                stroke( 80 );
                fill( (i+listStartAt) == hoverItem ? 200 : 120 );
                rect( x, y + (i*itemHeight), this.width, itemHeight );
                
                noStroke();
                fill( 0 );
                text( items.get(i+listStartAt).toString(), x+5, y+(i+1)*itemHeight-5 );
            }
        }
        
        if ( hasSlider )
        {
            stroke( 80 );
            fill( 100 );
            rect( x+width-20, y, 20, height );
            fill( 120 );
            rect( x+width-20, valueY, 20, 20 );
        }
    }
}

void keyPressed() {
  if (key=='M') {
    /*if ( msql.connect() )
    {  
      try {
        msql.query( "START TRANSACTION;" );
        msql.query( "CALL sp_compracl(1,1,FUN_ultima_venta()+1,"+");" );
        msql.query( "INSERT INTO detalle_venta values(FUN_ultima_venta(),2,17);" );
        msql.query( "ROLLBACK;" );
      }
      catch(Exception e) {
        msql.query( "ROLLBACK;" );
        println(e.getMessage());
      }
    }
    */homcond = false;
    invcond = true;
  }
}

void query() {
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
      println("Somemsqlthing went bad :V");
    }
    //msql.next();
    //println( "number of rows: " + msql.getInt(1) );
  } else
  {
    // connection failed !
  }
}
public void itemClicked ( int i, Object item )
{
    lastItemClicked = item;
}