using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using System.Data.Common;
using NIH.CMMS.Inventory.BOL.Common;


namespace NIH.CMMS.Inventory.DAL.Utility
{
    public class DBCommands
    {
        /// <summary>
        /// Gets the command object.
        /// </summary>
        /// <param name="commandText">The command text.</param>
        /// <param name="dbConn">The db conn.</param>
        /// <param name="parameters">The parameters.</param>
        /// <returns></returns>
        public static SqlCommand GetCommandObject(string commandText, SqlConnection dbConn, SqlParameter[] parameters)
        {
            //get db connection from util class
            SqlCommand dbCommand = new SqlCommand(commandText, dbConn);
            dbCommand.CommandType = CommandType.StoredProcedure;

            //set any paramters for the command object
            if (parameters != null)
            {
                dbCommand.Parameters.AddRange(parameters);

            }

            return dbCommand;
        }

        /// <summary>
        /// Parameters the maker.
        /// </summary>
        /// <param name="parameterName">Name of the parameter.</param>
        /// <param name="DbType">Type of the db.</param>
        /// <param name="Size">The size.</param>
        /// <param name="Direction">The direction.</param>
        /// <param name="Value">The value.</param>
        /// <returns></returns>
        public static SqlParameter ParameterMaker(String parameterName, SqlDbType DbType, Int32 Size, ParameterDirection Direction, Object Value)
        {
            SqlParameter param;
            if (Size > 0)
            {
                param = new SqlParameter(parameterName, DbType, Size);
            }
            else
            {
                param = new SqlParameter(parameterName, DbType);
            }
            param.Direction = Direction;
            if (!(Direction == ParameterDirection.Output && Value == null))
            {
                param.Value = Value;
            }
            return param;
        }

        /// <summary>        
        /// Gets the data set as result.
        /// </summary>
        /// <param name="commandText">The command text.</param>
        /// <param name="parameters">The parameters.</param>
        /// <returns></returns>
        public static DataSet GetData(string commandText, List<SqlParameter> parameters)
        {
            DataSet ds = null;
           
            using (SqlConnection dbConn = DBConnection.GetDBConnection())
            {
                using (SqlCommand myCommand = GetCommandObject(commandText, dbConn, (parameters != null) ? parameters.ToArray() : null))
                {
                    dbConn.Open();
                    using (SqlDataAdapter dataAdapter = new SqlDataAdapter())
                    {
                        ds = new DataSet();
                        dataAdapter.SelectCommand = myCommand;
                        try
                        {
                            dataAdapter.Fill(ds);                                                   
                        }
                        catch (Exception ex)
                        {                         
                           throw;                            
                        }
                    }
                }

                if (ds != null && ds.Tables[0].Rows.Count <= 0)
                {
                    ds = null;
                }
            }
            return ds;
        }

        /// <summary>
        /// Gets the string result (call executeScalar()).
        /// </summary>
        /// <param name="commandText">The command text.</param>
        /// <param name="dbConn">The db conn.</param>
        /// <param name="parameters">The parameters.</param>
        /// <returns></returns>
        public static string GetStringResult(string commandText, List<SqlParameter> parameters)
        {
            string strResult = string.Empty;
            using (SqlConnection dbConn = DBConnection.GetDBConnection())
            {
                using (SqlCommand cmd = GetCommandObject(commandText, dbConn, (parameters != null) ? parameters.ToArray() : null))
                {
                    dbConn.Open();
                    try
                    {
                        object result = cmd.ExecuteScalar();
                        //prevent calling ExecuteScalar again
                        if (result != null)
                        {
                            strResult = result.ToString();
                        }
                    }
                    catch (Exception ex)
                    {
                        throw;
                        
                    }
                }
            }

            return strResult;
        }

         /// <summary>
        /// Executes the non query with return value.
        /// </summary>
        /// <param name="commandText">The command text.</param>
        /// <param name="parameters">The parameters.</param>
        /// <returns></returns>
        public static ValidationResult ExecuteNonQueryWithResReturn(string commandText, List<SqlParameter> parameters)
        {
            
            using (SqlConnection dbConn = DBConnection.GetDBConnection())
            {
                using (SqlCommand cmd = GetCommandObject(commandText, dbConn, (parameters != null) ? parameters.ToArray() : null))
                { 
                    SqlParameter outResult = new SqlParameter("@res", SqlDbType.Int);
                    outResult.Direction = ParameterDirection.Output;
                    cmd.Parameters.Add(outResult);

                    dbConn.Open();
                    try
                    {
                        cmd.ExecuteNonQuery();
                        int result = Convert.ToInt32(outResult.Value);

                        if (result == 0)
                        {return new ValidationResult(true, string.Empty);}
                        //else if (result == -1)
                        //{return new ValidationResult(false, "Missing required fields.");}
                        else
                        {return new  ValidationResult(false, "SQL Error Code " + result);}
                    }
                    catch (Exception ex)
                    {
                        throw;
                       
                    }
                }
            }          
        }

        public static ValidationResult ExecuteNonQuery(string commandText, List<SqlParameter> parameters)
        {

            using (SqlConnection dbConn = DBConnection.GetDBConnection())
            {
                using (SqlCommand cmd = GetCommandObject(commandText, dbConn, (parameters != null) ? parameters.ToArray() : null))
                {
                    dbConn.Open();
                    try
                    {
                        cmd.ExecuteNonQuery();
                        return new ValidationResult(true, string.Empty);                       
                    }
                    catch (Exception ex)
                    {
                        return new ValidationResult(false, "Error: " + ex.Message);

                    }
                }
            }
        }

        //List<Course> courses = new List<Course>();

        //    using (SqlConnection conn = new SqlConnection(CourseDataAdapter.ConnectionString))
        //    {
        //        using (SqlCommand com = new SqlCommand("dbo.CoursesSelectByCoursesId", conn))
        //        {
        //            com.CommandType = CommandType.StoredProcedure;
        //            com.Parameters.Add(new SqlParameter("@CoursesId", SqlDbType.UniqueIdentifier)).Value = id;
        //            conn.Open();
        //            using (SqlDataReader dr = com.ExecuteReader())
        //            {
        //                if (dr.Read())
        //                {
        //                    courses.Add(new Course(id,
        //                                           dr.GetInt32(dr.GetOrdinal("Number")),
        //                                           dr.GetString(dr.GetOrdinal("Title")),
        //                                           dr.GetString(dr.GetOrdinal("Description")),
        //                                           dr.GetInt32(dr.GetOrdinal("Days"))));
        //                }
        //            }
        //        }
        //    }

        //protected virtual List<CategoryDetails> GetCategoryCollectionFromReader(IDataReader reader)
        //{
        //    List<CategoryDetails> categories = new List<CategoryDetails>();
        //    while (reader.Read())
        //        categories.Add(GetCategoryFromReader(reader));
        //    return categories;
        //}
        //protected virtual CategoryDetails GetCategoryFromReader(IDataReader reader)
        //{
        //    return new CategoryDetails(
        //       (int)reader["CategoryID"],
        //       (DateTime)reader["AddedDate"],
        //       reader["AddedBy"].ToString(),
        //       reader["Title"].ToString(),
        //       (int)reader["Importance"],
        //       reader["Description"].ToString(),
        //       reader["ImageUrl"].ToString());
        //}

        //protected virtual List<ArticleDetails> GetArticleCollectionFromReader(IDataReader reader, bool readBody)
        //{
        //    List<ArticleDetails> articles = new List<ArticleDetails>();
        //    while (reader.Read())
        //        articles.Add(GetArticleFromReader(reader, readBody));
        //    return articles;
        //}
        //protected virtual ArticleDetails GetArticleFromReader(IDataReader reader, bool readBody)
        //{
        //    ArticleDetails article = new ArticleDetails(
        //       (int)reader["ArticleID"],
        //       (DateTime)reader["AddedDate"],
        //       reader["AddedBy"].ToString(),
        //       (int)reader["CategoryID"],
        //       reader["CategoryTitle"].ToString(),
        //       reader["Title"].ToString(),
        //       reader["Abstract"].ToString(),
        //       null,
        //       reader["Country"].ToString(),
        //       reader["State"].ToString(),
        //       reader["City"].ToString(),
        //       (reader["ReleaseDate"] == DBNull.Value ? DateTime.Now : (DateTime)reader["ReleaseDate"]),
        //       (reader["ExpireDate"] == DBNull.Value ? DateTime.MaxValue : (DateTime)reader["ExpireDate"]),
        //       (bool)reader["Approved"],
        //       (bool)reader["Listed"],
        //       (bool)reader["CommentsEnabled"],
        //       (bool)reader["OnlyForMembers"],
        //       (int)reader["ViewCount"],
        //       (int)reader["Votes"],
        //       (int)reader["TotalRating"]);

        //    if (readBody)
        //        article.Body = reader["Body"].ToString();

        //    return article;
        //}

        //public static bool UpdateOrder(int id, int statusID, DateTime shippedDate, string transactionID, string trackingID)
        //{
        //    using (TransactionScope scope = new TransactionScope())
        //    {
        //        transactionID = BizObject.ConvertNullToEmptyString(transactionID);
        //        trackingID = BizObject.ConvertNullToEmptyString(trackingID);

        //        // retrieve the order's current status ID
        //        Order order = Order.GetOrderByID(id);

        //        // update the order
        //        OrderDetails record = new OrderDetails(id, DateTime.Now, "", statusID, "", "", 0.0m, 0.0m,
        //           "", "", "", "", "", "", "", "", "", "", shippedDate, transactionID, trackingID);
        //        bool ret = SiteProvider.Store.UpdateOrder(record);

        //        // if the new status ID is confirmed, than decrease the UnitsInStock for the purchased products
        //        if (statusID == (int)StatusCode.Confirmed && order.StatusID == (int)StatusCode.WaitingForPayment)
        //        {
        //            foreach (OrderItem item in order.Items)
        //                Product.DecrementProductUnitsInStock(item.ProductID, item.Quantity);
        //        }

        //        BizObject.PurgeCacheItems("store_order");
        //        scope.Complete();
        //        return ret;
        //    }
        //}
    }
}
