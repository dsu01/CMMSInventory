using System.Configuration;
using System.Data.SqlClient;

namespace NIH.CMMS.Inventory.DAL.Utility
{
    public class DBConnection
    {

        /// <summary>
        /// Gets the DB connection from connection string in web.config file.
        /// </summary>
        /// <returns></returns>
        public static SqlConnection GetDBConnection()
        {
            SqlConnection dbConnection = new SqlConnection(ConnectionString);
            return dbConnection;
        }

        /// <summary>
        /// Gets the connection string.
        /// </summary>
        /// <value>The connection string.</value>
        public static string ConnectionString
        {
            get { return ConfigurationManager.ConnectionStrings["msDATAWeb"].ConnectionString; }
        }
    }
}