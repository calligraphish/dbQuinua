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
            String ID_EMPRESA = dbconnection.getString("ID_EMPRESA");
            String NOMBRE_DE_EMPRESA = dbconnection.getString("NOMBRE_DE_EMPRESA");
            String TIPO_DE_EMPRESA = dbconnection.getString("TIPO_DE_EMPRESA");
            String PAGINA_WEB = dbconnection.getString("PAGINA_WEB");
            String REPRESENTANTE_LEGAL = dbconnection.getString("REPRESENTANTE_LEGAL");
            String TELEFONO_R_L = dbconnection.getString("TELEFONO_R_L");
            String REPRESENTANTE_COMERCIAL = dbconnection.getString("REPRESENTANTE_COMERCIAL");
            String TELEFONO_R_C = dbconnection.getString("TELEFONO_R_C");
            println(ID_EMPRESA + "          " + NOMBRE_DE_EMPRESA+ "          " +TIPO_DE_EMPRESA+ "          " +PAGINA_WEB+ "          " +REPRESENTANTE_LEGAL+ "          " +TELEFONO_R_L+ "          " +REPRESENTANTE_COMERCIAL+"          " +TELEFONO_R_C);
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
    
}

void draw()
{
    // i know this is not really a visual sketch ...
    sl_ESTABLECIMIENTO_V ();
}