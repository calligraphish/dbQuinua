import de.bezier.data.sql.*;

// created 2005-05-10 by fjenett
// updated fjenett 20080605


MySQL dbconnection;

void sl_ESTABLECIMIENTO_V (){
      if ( dbconnection.connect() )
    {
        // now read it back out
        //
        dbconnection.query( "SELECT * FROM ESTABLECIMIENTO_V;" );
        
        while (dbconnection.next())
        {
            String NOMBRE_DE_EMPRESA = dbconnection.getString("NOMBRE_DE_EMPRESA");
            String TIPO_DE_EMPRESA = dbconnection.getString("TIPO_DE_EMPRESA");
            String REPRESENTANTE_LEGAL = dbconnection.getString("REPRESENTANTE_LEGAL");
            String TELEFONO = dbconnection.getString("TELEFONO");
            println(NOMBRE_DE_EMPRESA+ "          " +TIPO_DE_EMPRESA+ "          " +REPRESENTANTE_LEGAL+ "          " +TELEFONO);
        }
    }
    else
    {
        // connection failed !
    }
}

void setup()
{
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
        sl_ESTABLECIMIENTO_V ();
}

void draw()
{
    // i know this is not really a visual sketch ...

}