using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using D = StockWebApp.DAL;
using M = StockWebApp.Model;

namespace StockWebApp.BLL
{
    public class ChartContent
    {
        //数组获取数据库融资余额
        public decimal[] GETREMAINING(string StockCode)
        {
            decimal[] REMAINING = new decimal[20];
            D.StockDAL dsd = new D.StockDAL();
            M.Stock ms = new M.Stock();
            DataSet ds = new DataSet();

            ds = dsd.GetREMAININGList(StockCode);

            for (int i = 0; i < 20; i++)
            {
                REMAINING[i] = decimal.Parse(ds.Tables[0].Rows[19 - i][5].ToString());
            }
            return REMAINING;
        }
        //数组获取数据库融资买入额
        public decimal[] GETPURCHASES(string StockCode)
        {
            decimal[] PURCHASES = new decimal[20];
            D.StockDAL dsd = new D.StockDAL();
            M.Stock ms = new M.Stock();
            DataSet ds = new DataSet();

            ds = dsd.GetREMAININGList(StockCode);

            for (int i = 0; i < 20; i++)
            {
                PURCHASES[i] = decimal.Parse(ds.Tables[0].Rows[19 - i][6].ToString());
            }
            return PURCHASES;
        }
        //数组获取数据库融券余量
        public int[] GETREMAINQUILITY(string StockCode)
        {
            int[] REMAINQUILITY = new int[20];
            D.StockDAL dsd = new D.StockDAL();
            M.Stock ms = new M.Stock();
            DataSet ds = new DataSet();

            ds = dsd.GetREMAININGList(StockCode);

            for (int i = 0; i < 20; i++)
            {
                REMAINQUILITY[i] = int.Parse(ds.Tables[0].Rows[19 - i][9].ToString());
            }
            return REMAINQUILITY;
        }
        //数组获取数据库融券卖出量
        public int[] GETSELLQUANTITY(string StockCode)
        {
            int[] SELLQUANTITY = new int[20];
            D.StockDAL dsd = new D.StockDAL();
            M.Stock ms = new M.Stock();
            DataSet ds = new DataSet();

            ds = dsd.GetREMAININGList(StockCode);

            for (int i = 0; i < 20; i++)
            {
                SELLQUANTITY[i] = int.Parse(ds.Tables[0].Rows[19 - i][10].ToString());
            }
            return SELLQUANTITY;
        }
        //数组获取数据库日期
        public DateTime[] GETDATE(string StockCode)
        {
            DateTime[] DATE = new DateTime[20];
            D.StockDAL dsd = new D.StockDAL();
            M.Stock ms = new M.Stock();
            DataSet ds = new DataSet();

            ds = dsd.GetREMAININGList(StockCode);

            for (int i = 0; i < 20; i++)
            {
                DATE[i] = DateTime.Parse(ds.Tables[0].Rows[19 - i][2].ToString());
            }
            return DATE;
        }

    }
}
