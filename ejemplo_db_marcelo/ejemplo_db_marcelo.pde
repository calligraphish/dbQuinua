import de.bezier.data.sql.*;

// created 2005-05-10 by fjenett
// updated fjenett 20080605


MySQL dbconnection;


void setup()
{
    size( 100, 100 );
    // this example assumes that you are running the 
    // mysql server locally (on "localhost").
    //
	
    // replace --username--, --password-- with your mysql-account.
    //
    String user     = "root";
    String pass     = "C0mplexity";
	
    // name of the database to use
    //
    String database = "db_1";
	
    // name of the table that will be created
    //
   // String table    = "";
	
    // connect to database of server "localhost"
    //
    dbconnection = new MySQL( this, "localhost", database, user, pass );
    
    if ( dbconnection.connect() )
    {
        // now read it back out
        //
        dbconnection.query( "SELECT * FROM vw_rutarepartidor;" );
        
        while (dbconnection.next())
        {
            String fecha = dbconnection.getString("FECHA");
            String repartidor = dbconnection.getString("REPARTIDOR");
            String ruta = dbconnection.getString("RUTA");
            println(fecha + "   " + repartidor+"  "+ruta);
        }
    }
    else
    {
        // connection failed !
    }
}

void draw()
{
    // i know this is not really a visual sketch ...
}