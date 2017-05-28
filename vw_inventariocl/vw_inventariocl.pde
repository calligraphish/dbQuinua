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
    String pass     = "ROOT123";
	
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
        dbconnection.query( "SELECT * FROM vw_inventariocl;" );
        
        while (dbconnection.next())
        {
            String ID = dbconnection.getString("ID");
            String PRODUCTO = dbconnection.getString("PRODUCTO");
            String PRECIO = dbconnection.getString("PRECIO");
            String CANTIDAD = dbconnection.getString("CANTIDAD");
            println(ID + "          " + PRODUCTO+ "          " +PRECIO+ "          " +CANTIDAD);
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