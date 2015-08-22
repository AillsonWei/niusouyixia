using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using StockWebApp.Model;

namespace StockWebApp.DAL
{
    public class StockService
    {
        /// <summary>
        /// 按股票代码或股票名称查询
        /// </summary>
        /// <param name="name"></param>
        /// <returns></returns>
        public static DataSet SearchStockByName(string name)
        {
            DataSet ds = null;
            string strConn = ConfigurationManager.AppSettings["sqlConn"].ToString();
            using (SqlConnection conn = new SqlConnection(strConn))
            {
                try
                {
                    conn.Open();
                    string searchByName = ConfigurationManager.AppSettings["sqlSearchStockByName"].ToString();
                    SqlCommand command = new SqlCommand(searchByName, conn);
                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@STOCK_NAME", name);
                    SqlDataAdapter dp = new SqlDataAdapter(command);
                    ds = new DataSet();
                    dp.Fill(ds);
                    conn.Close();
                }
                catch (Exception ex)
                {
                    string message = ex.Message;
                }
            }

            return ds;
        }

        /// <summary>
        /// 按股票代码、股票名称及交易日期查询
        /// </summary>
        /// <param name="tradeDate"></param>
        /// <param name="stockName"></param>
        /// <returns></returns>
        public static DataSet SearchStockByTradeDate(DateTime tradeDate, string stockName)
        {
            DataSet ds = null;
            string strConn = ConfigurationManager.AppSettings["sqlConn"].ToString();
            using (SqlConnection conn = new SqlConnection(strConn))
            {
                try
                {
                    conn.Open();
                    string searchByTradeDate = ConfigurationManager.AppSettings["sqlSearchStockByTradeDate"].ToString();
                    SqlCommand command = new SqlCommand(searchByTradeDate, conn);
                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@TRADE_DATE", tradeDate);
                    command.Parameters.AddWithValue("@STOCK_NAME", stockName);
                    SqlDataAdapter dp = new SqlDataAdapter(command);
                    ds = new DataSet();
                    dp.Fill(ds);
                    conn.Close();
                }
                catch (Exception ex)
                {
                    string message = ex.Message;
                }
            }

            return ds;
        }

        /// <summary>
        /// 按股票代码、股票名称及交易日期查询
        /// </summary>
        /// <param name="tradeDate"></param>
        /// <param name="stockName"></param>
        /// <returns></returns>
        public static int CreateStock(List<Stock> stockDetails)
        {
            if (stockDetails == null || stockDetails.Count == 0)
                return 0; //当天没有股票交易

            string strConn = ConfigurationManager.AppSettings["sqlConn"].ToString();
            string createStock = ConfigurationManager.AppSettings["sqlCreateStock"].ToString();
            using (SqlConnection conn = new SqlConnection(strConn))
            {
                conn.Open();
                foreach (Stock detail in stockDetails)
                {
                    SqlCommand command = new SqlCommand(createStock, conn);
                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@TRADE_DATE", detail.TRADE_DATE);
                    command.Parameters.AddWithValue("@STOCK_CODE", detail.STOCK_CODE);
                    command.Parameters.AddWithValue("@STOCK_NAME", detail.STOCK_NAME);
                    command.Parameters.AddWithValue("@REMAINING", detail.REMAINING);
                    command.Parameters.AddWithValue("@PURCHASES", detail.PURCHASES);
                    command.Parameters.AddWithValue("@PAYMENTS", detail.PAYMENTS);
                    command.Parameters.AddWithValue("@REMAIN_SUM", detail.REMAIN_SUM);
                    command.Parameters.AddWithValue("@REMAIN_QUANTITY", detail.REMAIN_QUANTITY);
                    command.Parameters.AddWithValue("@SELL_QUANTITY", detail.SELL_QUANTITY);
                    command.Parameters.AddWithValue("@REIMBURSED_FLOAT", detail.REIMBURSED_FLOAT);
                    command.Parameters.AddWithValue("@SECURITIES_BALANCES", detail.SECURITIES_BALANCES);

                    try
                    {
                        command.ExecuteScalar();
                    }
                    catch(Exception e)
                    {
                        string message = e.Message;
                        return 2;//执行错误
                    }
                }
                conn.Close();
            }

            return 1; //执行成功
        }

    }
}